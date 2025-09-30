package com.tnm.shared.presentation.dashboard.ui

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.tnm.quizappkmp.domain.DashboardData
import com.tnm.quizappkmp.presentation.utils.ui.BaseCardView
import com.tnm.quizappkmp.presentation.utils.ui.CircleWithNumber
import com.tnm.quizappkmp.presentation.utils.ui.SpacerLargeWidth
import org.jetbrains.compose.resources.DrawableResource
import org.jetbrains.compose.resources.painterResource
import quizappkmp.composeapp.generated.resources.Res
import quizappkmp.composeapp.generated.resources.ic_android_icon
import quizappkmp.composeapp.generated.resources.ic_java_icon
import quizappkmp.composeapp.generated.resources.ic_kotlin_icon

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
                    painter = painterResource(resource = getIcon(item.sectionId)),
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


private fun getIcon(sectionId: Int): DrawableResource {
    return when (sectionId) {
        1 -> Res.drawable.ic_android_icon
        2 -> Res.drawable.ic_kotlin_icon
        3 -> Res.drawable.ic_java_icon
        else -> Res.drawable.ic_android_icon
    }
}
@Composable
fun SpacerMediumWidth() {
    Spacer(modifier = Modifier.width(8.dp))
}
@Composable
fun TvDashboardTitle(
    text: String,
    modifier: Modifier = Modifier
) {
    Text(
        text = text,
        style = TextStyle(
            fontWeight = FontWeight.Bold,
            fontSize = 16.sp,
            color = Color.Blue
        ),
        maxLines = 2,
        overflow = TextOverflow.Ellipsis,
        modifier = modifier
    )
}