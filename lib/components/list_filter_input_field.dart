import 'package:flutter/material.dart';
import 'package:iburguer/assets/assets.dart';

class ListFilterInputField extends StatelessWidget {
  final Function(String?) filterCallback;
  final String label;
  final TextEditingController query = TextEditingController();
  ListFilterInputField(
      {required this.filterCallback, this.label = 'Buscar colaborador'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: TextFormField(
        enableSuggestions: false,
        cursorColor: AppColors.appBarFG,
        style: AppTextStyles.regularText(size: 16, color: AppColors.appBarFG),
        controller: query,
        minLines: 1,
        maxLines: 1,
        enabled: true,
        autofocus: true,
        autocorrect: false,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: Icon(Icons.clear, size: 20, color: AppColors.appBarFG),
              onPressed: () {
                query.text = '';
                filterCallback(null);
              }),
          contentPadding: EdgeInsets.all(10.0),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          labelStyle: AppTextStyles.labelStyle,
          helperStyle: AppTextStyles.helperStyle,
          hintStyle: AppTextStyles.appBarHhintStyle,
          errorStyle: AppTextStyles.errorStyle,
          hintText: label,
          counterText: '',
        ),
        keyboardType: TextInputType.name,
        onChanged: filterCallback,
      ),
    );
  }
}
