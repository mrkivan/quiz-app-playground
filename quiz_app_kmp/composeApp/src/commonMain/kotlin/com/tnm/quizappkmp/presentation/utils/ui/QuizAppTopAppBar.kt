package com.tnm.quizappkmp.presentation.utils.ui

import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.style.TextOverflow

// Data class to configure the toolbar
data class QuizAppToolbar(
    val title: String = "",
    val navigationIcon: ImageVector? = null,
    val navigationIconContentDescription: String? = null,
    val onNavigationClick: (() -> Unit)? = null,
    val actions: List<ToolbarAction> = emptyList()
)

data class ToolbarAction(
    val icon: ImageVector,
    val contentDescription: String,
    val onClick: () -> Unit
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun QuizAppTopAppBar(
    toolbarConfig: QuizAppToolbar,
    modifier: Modifier = Modifier
) {
    TopAppBar(
        title = {
            Text(
                text = toolbarConfig.title,
                style = MaterialTheme.typography.titleMedium,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )

        },
        navigationIcon = {
            toolbarConfig.navigationIcon?.let { icon ->
                IconButton(onClick = { toolbarConfig.onNavigationClick?.invoke() }) {
                    Icon(
                        imageVector = icon,
                        contentDescription = toolbarConfig.navigationIconContentDescription,
                        tint = MaterialTheme.colorScheme.onPrimary
                    )
                }
            }
        },
        actions = {
            toolbarConfig.actions.forEach { action ->
                IconButton(onClick = action.onClick) {
                    Icon(
                        imageVector = action.icon,
                        contentDescription = action.contentDescription,
                        tint = MaterialTheme.colorScheme.onPrimary
                    )
                }
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = MaterialTheme.colorScheme.primary,
            titleContentColor = MaterialTheme.colorScheme.onPrimary,
            navigationIconContentColor = MaterialTheme.colorScheme.onPrimary,
            actionIconContentColor = MaterialTheme.colorScheme.onPrimary
        ),
        modifier = modifier
    )
}