import 'package:app_curso/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  // 1
  // categoryModel = new CategoryModel();
  // // categoryModel.categoryName = "Policial";
  // categoryModel.categoryName = "Business";
  // categoryModel.imageUrl =
  //     "https://jcconcursos.uol.com.br/media/_versions/noticia/carreiras-policiais2_widelg.jpg";
  // category.add(categoryModel);
  //
    categoryModel = new CategoryModel();
   categoryModel.categoryName = "Policial";  
  categoryModel.imageUrl =
      "https://jcconcursos.uol.com.br/media/_versions/noticia/carreiras-policiais2_widelg.jpg";
  category.add(categoryModel);
 


  // 2
  categoryModel = new CategoryModel();
  // categoryModel.categoryName = "Tribunal";
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
      "https://conceitos.com/wp-content/uploads/2014/05/Tribunal.jpg";
  category.add(categoryModel);

  // 3
  categoryModel = new CategoryModel();
  // categoryModel.categoryName = "Fiscal";
  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
      "https://d1cb96qxozavf7.cloudfront.net/news/fisc-960.jpg";
  category.add(categoryModel);

  // 4
  categoryModel = new CategoryModel();
  // categoryModel.categoryName = "Fiscal";
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl =
      "https://d1cb96qxozavf7.cloudfront.net/news/fisc-960.jpg";
  category.add(categoryModel);

  // 5
  categoryModel = new CategoryModel();
  // categoryModel.categoryName = "Fiscal";
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl =
      "https://businessday.ng/wp-content/uploads/2019/11/Technology-industry-512x341.jpg";
  category.add(categoryModel);

  return category;
}
