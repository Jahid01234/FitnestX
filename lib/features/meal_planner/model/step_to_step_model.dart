class StepToStepModel {
  final String stepNo;
  final String title;
  final String description;

  StepToStepModel ({
    required this.stepNo,
    required this.title,
    required this.description,
  });
}


final List<StepToStepModel> steps = [
  StepToStepModel(
    stepNo: '01',
    title: 'Step 1',
    description: 'Prepare all of the ingredients that needed',
  ),
  StepToStepModel(
    stepNo: '02',
    title: 'Step 2',
    description: 'Mix flour, sugar, salt, and baking powder',
  ),
  StepToStepModel(
    stepNo: '03',
    title: 'Step 3',
    description: 'In a seperate place, mix the eggs and liquid milk until blended',
  ),
  StepToStepModel(
    stepNo: '04',
    title: 'Step 4',
    description: 'Put the egg and milk mixture into the dry ingredients, Stir untul smooth and smooth',
  ),
  StepToStepModel(
    stepNo: '05',
    title: 'Step 5',
    description: 'Prepare all of the ingredients that needed',
  ),
];