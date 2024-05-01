import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/helper/category_helper.dart';
import 'package:fastfoodapp/data/model/category.dart';
import 'package:flutter/material.dart';

class CategoryAdd extends StatefulWidget {
  final bool isUpdate;
  final CategoryModel? categoryModel;
  const CategoryAdd({super.key, this.isUpdate=false,this.categoryModel});

  @override
  State<CategoryAdd> createState() => _CategoryAddState();
}

class _CategoryAddState extends State<CategoryAdd> {
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _descriptionController=TextEditingController();
  String titleText="";
  final DatabaseHelper _databaseService =DatabaseHelper();
  Future<void> _onSave() async {
    final name=_nameController.text;
    final description=_descriptionController.text;

    await _databaseService
        .insertCategory(CategoryModel(name: name, description: description));
    setState(() {});
    Navigator.pop(context);
  }

  Future<void> _onUpdate() async{
    final name=_nameController.text;
    final description=_descriptionController.text;

    await _databaseService.updateCategory(CategoryModel(
      name: name, description: description, id:widget.categoryModel!.id));

    Navigator.pop(context);
  }

  @override
  void initState(){
    super.initState();
    if(widget.categoryModel!=null && widget.isUpdate){
      _nameController.text=widget.categoryModel!.name;
      _descriptionController.text=widget.categoryModel!.description;
    }
    if(widget.isUpdate){
      titleText="Update Category";
    } else {
      titleText="Add New Category";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            textInput('Enter name', _nameController),
            const SizedBox(height: 16.0,),
            textInput('Enter Discription', _descriptionController),
            const SizedBox(height: 16.0,),
            SizedBox(
              height: 45.0,
              child: ElevatedButton(
                onPressed:() {
                  widget.isUpdate ?_onUpdate():_onSave();
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}