import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:readmore/readmore.dart';

class HealtyTips extends StatefulWidget {
  const HealtyTips({super.key});

  @override
  State<HealtyTips> createState() => _HealtyTipsState();
}

class _HealtyTipsState extends State<HealtyTips> {
  String content =
      "In today's digital age, health tracking apps have emerged as powerful tools for individuals seeking to improve their overall well-being and achieve their health goals. These apps, which are easily accessible on smartphones and wearable devices, enable users to monitor various aspects of their health and provide valuable insights and feedback. By leveraging the convenience and functionality of health tracking apps, individuals can make informed decisions, stay motivated, and effectively track their progress towards their desired health outcomes. This article explores the numerous ways in which health tracking apps can support individuals in reaching their health goals. 1. Setting Clear and Measurable Goals: Health tracking apps offer users the ability to set clear and measurable health goals. Whether its losing weight, increasing physical activity, monitoring sleep patterns, or managing stress levels, these apps provide a platform to define specific targets and track progress over time. By establishing tangible objectives, individuals can stay focused and motivated, as they can visually see their advancements and celebrate milestones along the way.Monitoring and Analyzing Health Data: One of the key features of health tracking apps is their ability to collect and analyze various health data points. These apps can monitor metrics such as heart rate, steps taken, calories burned, sleep quality, and even blood pressure or glucose levels (if integrated with compatible devices). By regularly tracking this data, users gain a comprehensive understanding of their health patterns and behaviors. Analyzing trends and patterns can help identify areas that need improvement, highlight progress, and provide insights for optimizing ones health regimen. 2. Encouraging Accountability and Consistency: Health tracking apps act as personal virtual assistants, reminding individuals to stay on track with their health goals. Through push notifications and reminders, these apps help establish accountability and encourage consistency. Whether it's a gentle nudge to exercise, reminders to take medication, or prompts to drink enough water, these apps foster adherence to healthy habits and prevent individuals from veering off course.Providing Personalized Recommendations: Based on the data collected, health tracking apps can offer personalized recommendations to enhance health outcomes. For instance, if an individual's sleep data indicates poor sleep quality, the app may suggest adjustments to bedtime routines or recommend relaxation techniques. Similarly, if a user's physical activity is below the target, the app might propose tailored exercise routines or provide motivational messages to boost activity levels. Such personalized guidance empowers individuals to make informed decisions and adapt their lifestyle choices accordingly. 3. Facilitating Social Support and Community Engagement: Many health tracking apps feature social networking elements that enable users to connect with like-minded individuals and create a sense of community. By participating in challenges, sharing progress, and seeking advice or support, individuals can enhance their motivation, gain valuable insights from others, and overcome obstacles together. The support and camaraderie offered within these app-based communities can make the journey towards health goals more enjoyable and sustainable. Health tracking apps have revolutionized the way individuals approach their health and wellness journeys. By leveraging the power of technology, these apps provide a range of benefits, from setting clear goals and monitoring progress to offering personalized recommendations and fostering community engagement. By utilizing health tracking apps, individuals can take charge of their health, stay motivated, and make meaningful strides towards their desired health outcomes. Embracing these digital tools as companions in the pursuit of better health can pave the way for a happier, healthier future.";

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(0, 49, 0, 0),
      child: SingleChildScrollView(
        child: SizedBox(
          width: mediaquery.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/mobile.jpeg"))),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                            'How Health Tracking Apps Can Help You Reach Your Health Goals',
                            style: ThemeText.headingHealtyTips,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 8),
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          child: ReadMoreText(content,
                              trimLines: 20,
                              textAlign: TextAlign.justify,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: "Show More",
                              trimExpandedText: "Show Less",
                              style: ThemeText.headingCoustomHealtyTips))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
