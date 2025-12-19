class HowToStepModel {
  final String stepNo;
  final String title;
  final String description;

  HowToStepModel({
    required this.stepNo,
    required this.title,
    required this.description,
  });
}


final List<HowToStepModel> steps = <HowToStepModel>[
  HowToStepModel(
    stepNo: '01',
    title: 'Spread Your Arms',
    description:
    'To make the gestures feel more relaxed, stretch your arms as you start this'
        ' movement. No bending of hands.',
  ),
  HowToStepModel(
    stepNo: '02',
    title: 'Rest at The Toe',
    description:
    'The basis of this movement is jumping. Now, what needs to be considered is '
        'that you have to use the tips of your feet.',
  ),
  HowToStepModel(
    stepNo: '03',
    title: 'Adjust Foot Movement',
    description:
    'Jumping Jack is not just an ordinary jump. But, you also have to pay close '
        'attention to leg movements.',
  ),
  HowToStepModel(
    stepNo: '04',
    title: 'Clapping Both Hands',
    description:
    'This cannot be taken lightly. Without realizing it, the clapping of your '
        'hands helps you to keep your rhythm.',
  ),
];