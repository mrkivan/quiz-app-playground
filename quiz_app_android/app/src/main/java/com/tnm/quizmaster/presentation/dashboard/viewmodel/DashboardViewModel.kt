package com.tnm.quizmaster.presentation.dashboard.viewmodel

import androidx.lifecycle.viewModelScope
import com.tnm.quizmaster.domain.model.Resource
import com.tnm.quizmaster.domain.model.dashboard.DashboardData
import com.tnm.quizmaster.domain.usecase.dashboard.GetDashboardDataUseCase
import com.tnm.quizmaster.presentation.dashboard.intent.DashboardIntent
import com.tnm.quizmaster.presentation.dashboard.intent.DashboardNavEvent
import com.tnm.quizmaster.presentation.utils.viewmodel.BaseViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.flow.catch
import kotlinx.coroutines.flow.onStart
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class DashboardViewModel @Inject constructor(
    private val getDashboardDataUseCase: GetDashboardDataUseCase
) : BaseViewModel<DashboardData>() {
    private val _navigationEvents = MutableSharedFlow<DashboardNavEvent>()
    val navigationEvents = _navigationEvents.asSharedFlow()
    fun handleIntent(intent: DashboardIntent) {
        when (intent) {
            is DashboardIntent.LoadDashboard -> loadDashboard()
            is DashboardIntent.NavigateToQuizSets -> navigateToDetails(intent.item)
        }
    }

    private fun loadDashboard() {
        viewModelScope.launch {
            getDashboardDataUseCase()
                .onStart {
                    setLoading()
                }
                .catch { e ->
                    setError(e.message.orEmpty())
                }
                .collect { dashboard ->
                    when (dashboard) {
                        is Resource.Failure -> setError(dashboard.error.message.orEmpty())
                        is Resource.Success -> {
                            setSuccess(dashboard.data)
                        }
                    }

                }
        }
    }

    private fun navigateToDetails(item: DashboardData.Item) {
        viewModelScope.launch {
            _navigationEvents.emit(DashboardNavEvent.NavigateToQuizSets(item))
        }
    }

}