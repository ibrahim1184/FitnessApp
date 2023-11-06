// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

class CustomEasyStep extends StatefulWidget {
  const CustomEasyStep({super.key});

  @override
  State<CustomEasyStep> createState() => _CustomEasyStepState();
}

class _CustomEasyStepState extends State<CustomEasyStep> {
  int activeStep = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 150),
      child: Column(
        children: [
          CustomStepper(
            activeColor: Colors.pink,
            passiveColor: Colors.grey,
            isMultipleActiveStep: false,
            activeStep: activeStep,
            onStepTapped: (index) {
              setState(() {
                activeStep = index;
              });
            }, 
            steps: [
              CustomStep(
                title: 'Preparation',
                subtitle: '10 min',
                icon: Icons.radio_button_unchecked_rounded,
              ),
              CustomStep(
                title: 'Cooking',
                subtitle: '30 min',
                icon: Icons.radio_button_unchecked_rounded,
              ),
              const CustomStep(
                title: 'Resting',
                subtitle: '1 hour',
                icon: Icons.radio_button_unchecked_rounded,
              ),
              const CustomStep(
                title: 'Ready',
                subtitle: '1 hour',
                icon: Icons.radio_button_unchecked_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomStepper extends StatelessWidget {
  const CustomStepper(
      {Key? key,
      required this.steps,
      this.activeColor = Colors.pink,
      this.passiveColor = Colors.pink,
      required this.activeStep,
      this.onStepTapped,
      this.isMultipleActiveStep = true})
      : super(key: key);

  final List<CustomStep> steps;
  final Color activeColor;
  final Color passiveColor;
  final int activeStep;
  final void Function(int index)? onStepTapped;
  // leftItemBuilder 
  final bool isMultipleActiveStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: steps
          .asMap()
          .map(
            (index, e) => MapEntry(
              index,
              CustomStep(
                title: e.title,
                subtitle: e.subtitle,
                icon: e.icon,
                onTap: e.onTap ?? () => onStepTapped?.call(index),
                enableEndLine: e.enableEndLine ?? (steps.length - 1 != index),
                activeColor: e.activeColor ?? activeColor,
                passiveColor: e.passiveColor ?? passiveColor, 
                isActive: isMultipleActiveStep
                    ? activeStep >= index
                    : activeStep == index,
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}

class CustomStep extends StatelessWidget {
  const CustomStep({
    super.key,
    this.icon = Icons.radio_button_unchecked_rounded,
    this.title = '',
    this.subtitle = '',
    this.activeColor,
    this.passiveColor,
    this.enableEndLine,
    this.onTap,
    this.isActive = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color? activeColor;
  final Color? passiveColor;
  final bool? enableEndLine;
  final void Function()? onTap;
  final bool isActive;
  /// leftWidget iste  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('01'),
          const SizedBox(width: 10),
          Column(
            children: [
              Icon(
                icon,
                color: isActive ? activeColor : passiveColor,
              ),
              enableEndLine == true
                  ? Dash(
                      direction: Axis.vertical,
                      length: 50,
                      dashLength: 5,
                      dashColor: isActive
                          ? activeColor ?? Colors.grey
                          : passiveColor ?? Colors.grey,
                    )
                  : const SizedBox()
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.black38, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
