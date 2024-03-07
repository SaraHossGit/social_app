import 'package:flutter/material.dart';
import 'package:social_app/model/post_model.dart';
import 'package:social_app/shared/component/components.dart';
import 'package:social_app/shared/style/colors.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  FeedsScreen({super.key});

  TextEditingController searchController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  List<dynamic> storiesList = [
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900"
  ];

  List<PostModel> postsList = [
    PostModel(
      profileImg:
          "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
      username: "Sara Hossam",
      date: "2 days ago",
      postBody:
          "If you are an infrequent traveler you may need some tips to keep the wife happy while you are jet setting around the globe.",
      postImg:
          "https://img.freepik.com/free-photo/majestic-mountain-peak-tranquil-winter-landscape-generated-by-ai_188544-15662.jpg?size=626&ext=jpg&ga=GA1.1.1422658711.1709631626",
      postCommentsCount: 150,
      postLikesCount: 500,
    ),
    PostModel(
      profileImg:
          "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
      username: "Sara Hossam",
      date: "2 days ago",
      postBody:
          "If you are an infrequent traveler you may need some tips to keep the wife happy while you are jet setting around the globe.",
      postImg:
          "https://img.freepik.com/free-photo/majestic-mountain-peak-tranquil-winter-landscape-generated-by-ai_188544-15662.jpg?size=626&ext=jpg&ga=GA1.1.1422658711.1709631626",
      postCommentsCount: 150,
      postLikesCount: 500,
    ),
    PostModel(
      profileImg:
          "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
      username: "Sara Hossam",
      date: "2 days ago",
      postBody:
          "If you are an infrequent traveler you may need some tips to keep the wife happy while you are jet setting around the globe.",
      postImg:
          "https://img.freepik.com/free-photo/majestic-mountain-peak-tranquil-winter-landscape-generated-by-ai_188544-15662.jpg?size=626&ext=jpg&ga=GA1.1.1422658711.1709631626",
      postCommentsCount: 150,
      postLikesCount: 500,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Search Bar
          Row(
            children: [
              Expanded(
                child: defaultTextFormField(
                    context: context,
                    labelText: "Search",
                    controller: searchController,
                    prefixIcon: IconBroken.Search,
                    fillColor: darkGreyColor,
                    validator: (value) {}),
              ),
              SizedBox(width: 10),
              defaultIconButton(icon: IconBroken.Camera)
            ],
          ),
          SizedBox(height: 20),

          /// Stories
          Text("Stories", style: Theme.of(context).textTheme.displaySmall),
          SizedBox(height: 10),
          storiesListBuilder(storiesList: storiesList),

          /// Posts List
          postsListBuilder(
              commentController: commentController, postsList: postsList),
        ],
      ),
    ));
  }
}
