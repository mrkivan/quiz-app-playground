package com.tnm.quizmaster.presentation.dashboard.ui

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.size
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.tnm.quizmaster.R
import com.tnm.quizmaster.domain.model.dashboard.DashboardData
import com.tnm.quizmaster.presentation.utils.ui.BaseCardView
import com.tnm.quizmaster.presentation.utils.ui.CircleWithNumber
import com.tnm.quizmaster.presentation.utils.ui.SpacerLargeWidth
import com.tnm.quizmaster.presentation.utils.ui.SpacerMediumWidth
import com.tnm.quizmaster.presentation.utils.ui.TvDashboardTitle

@Composable
fun DashboardScreenItem(item: DashboardData.Item, onClick: () -> Unit) {
    BaseCardView(
        modifier = Modifier,
        onClick = onClick,
        bodyContent = {
            Row(
                modifier = Modifier
                    .fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.Start
            ) {
                Image(
                    painter = painterResource(id = getIcon(item.sectionId)),
                    contentDescription = "${item.title} Icon",
                    modifier = Modifier.size(32.dp)
                )

                SpacerLargeWidth()

                TvDashboardTitle(item.title, Modifier.weight(1f))

                SpacerMediumWidth()

                CircleWithNumber(item.total)
            }
        }
    )
}


private fun getIcon(sectionId: Int): Int {
    return when (sectionId) {
        1 -> R.drawable.ic_android_icon
        2 -> R.drawable.ic_kotlin_icon
        3 -> R.drawable.ic_java_icon
        else -> R.drawable.ic_android_icon
    }
}


@Preview(showBackground = true)
@Composable
fun DashboardPreview() {
    MaterialTheme {
        DashboardScreenItem(mockDashboardItem) {
            // do nothing
        }
    }
}
