import 'package:flutter/material.dart';
import 'package:social_app/model/post_model.dart';
import 'package:social_app/shared/style/colors.dart';
import 'package:social_app/shared/style/icon_broken.dart';

/// General Defaults
Widget defaultButtonWhite({
  required BuildContext context,
  required String buttonText,
  required VoidCallback onPressed,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: primaryColor1),
        ),
      ),
    );

Widget defaultButtonGradient({
  required BuildContext context,
  required String buttonText,
  required VoidCallback onPressed,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            primaryColor2,
            primaryColor2,
            primaryColor1,
            primaryColor1,
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );

Widget defaultTextButton({
  required BuildContext context,
  required String buttonText,
  required VoidCallback onPressed,
}) =>
    Center(
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.bodyLarge,
            )));

Widget defaultBackground({
  required BuildContext context,
  required String imagePath,
  IconData? icon,
  VoidCallback? onIconPressed,
}) =>
    Stack(
      children: [
        /// Background Image
        Image.network(
          imagePath,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),

        /// Grey Overlay
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              darkGreyColor.withOpacity(0.2),
              secondaryColor.withOpacity(0.4),
              secondaryColor,
            ],
          )),
        ),

        /// Icon
        Positioned(
            top: 50,
            left: 12,
            child: IconButton(onPressed: onIconPressed, icon: Icon(icon))),
      ],
    );

Widget defaultTextFormField({
  required BuildContext context,
  required String labelText,
  required TextEditingController controller,
  required String? Function(String?)? validator,
  Color? fillColor,
  double? height,
  IconData? prefixIcon,
  VoidCallback? onSuffixPressed,
  bool isPasswordObscure = false,
  bool isPassword = false,
}) =>
    SizedBox(
      height: height ?? 50,
      width: double.infinity,
      child: TextFormField(
        obscureText: isPasswordObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.white,
          ),
          contentPadding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
          label: Text(
            labelText,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: Colors.transparent, width: 1)),
          fillColor: fillColor ?? Colors.white10.withOpacity(0.5),
          filled: true,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isPasswordObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: onSuffixPressed ?? () {},
                )
              : const SizedBox(),
        ),
        controller: controller,
        validator: validator,
      ),
    );

Widget defaultEditButton({size}) => CircleAvatar(
      radius: size == null ? 15 : size - 3,
      backgroundColor: Colors.white,
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            IconBroken.Edit,
            size: size ?? 18,
            color: primaryColor1,
          ),
          onPressed: () {},
        ),
      ),
    );

Widget defaultDeleteButton({size}) => CircleAvatar(
      radius: size == null ? 15 : size - 3,
      backgroundColor: Colors.white,
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            IconBroken.Delete,
            size: size ?? 18,
            color: primaryColor1,
          ),
          onPressed: () {},
        ),
      ),
    );

Widget defaultIconButton({required IconData icon}) => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              primaryColor2,
              primaryColor2,
              primaryColor1,
              primaryColor1,
            ],
          ),
          shape: BoxShape.circle),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            icon,
            size: 25,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );

/// Profile Screen
Widget profileCoverImage({
  required BuildContext context,
  required String coverImg,
  required String profileImg,
  required String username,
}) =>
    Container(
      height: 250,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.network(
            coverImg,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(profileImg),
                ),
                const SizedBox(width: 20),
                Text(
                  username,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          )
        ],
      ),
    );

Widget statContainer({
  required BuildContext context,
  required int stat,
  required String title,
}) =>
    Column(
      children: [
        Text(stat.toString(), style: Theme.of(context).textTheme.titleMedium),
        Text(title),
      ],
    );

Widget photoItemBuilder({required String image}) => ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(
        image,
        width: 100,
        fit: BoxFit.cover,
      ),
    );

Widget editPhotoItemBuilder({required String image}) => Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            image,
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 85.0),
          child: defaultDeleteButton(),
        )
      ],
    );

Widget photosListBuilder(
        {required List<dynamic> photosList, bool edit = false}) =>
    SizedBox(
      height: 150,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => edit
              ? editPhotoItemBuilder(image: photosList[index])
              : photoItemBuilder(image: photosList[index]),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: photosList.length),
    );

Widget friendsItemBuilder({required String image}) => CircleAvatar(
      radius: 30,
      child: CircleAvatar(
        radius: 28,
        backgroundImage: NetworkImage(
          image,
        ),
      ),
    );

Widget friendsListBuilder({required List<dynamic> friendsList}) => SizedBox(
      height: 60,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              friendsItemBuilder(image: friendsList[index]),
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: 5),
    );

/// Edit Profile Screen
Widget editProfileCoverImage({
  required BuildContext context,
  required String coverImg,
  required String profileImg,
  required String username,
}) =>
    Container(
      height: 250,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.network(
            coverImg,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: defaultEditButton(),
              )),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(profileImg),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: defaultEditButton(),
                    )
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    initialValue: username,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );

/// Feeds Screen
Widget storyItemBuilder(
        {required String image, required BuildContext context}) =>
    Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      primaryColor2,
                      primaryColor2,
                      primaryColor1,
                      primaryColor1,
                    ],
                  ),
                  shape: BoxShape.circle),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: secondaryColor,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    image,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
            width: 70,
            child: Text(
              "Mildred Miles James",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  height: 1, overflow: TextOverflow.ellipsis, fontSize: 10),
              maxLines: 2,
              textAlign: TextAlign.center,
            ))
      ],
    );

Widget storiesListBuilder({required List<dynamic> storiesList}) => SizedBox(
      height: 105,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              storyItemBuilder(image: storiesList[index], context: context),
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: 5),
    );

Widget postItemBuilder(
        {required BuildContext context,
        required PostModel postModel,
        required TextEditingController commentController}) =>
    Card(
      color: secondaryColor,
      shadowColor: Colors.black,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Post Header
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: secondaryColor,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      postModel.profileImg ?? "",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postModel.username ?? "",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(postModel.date ?? "")
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(IconBroken.More_Circle))
              ],
            ),
            const SizedBox(height: 10),

            /// Post Body
            Text(
              postModel.postBody ?? "",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(postModel.postImg ?? ""),
            ),

            /// Post Trailer
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: defaultTextFormField(
                        context: context,
                        labelText: "Comment",
                        fillColor: darkGreyColor,
                        height: 40,
                        controller: commentController,
                        validator: (value) {})),
                const SizedBox(width: 6),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 55,
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Heart,
                          color: primaryColor1,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${postModel.postLikesCount ?? 0}",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: primaryColor1),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 55,
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Chat,
                          color: primaryColor2,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${postModel.postCommentsCount ?? 0}",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: primaryColor2),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

Widget postsListBuilder(
        {required TextEditingController commentController,
        required List<dynamic> postsList}) =>
    Expanded(
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => postItemBuilder(
              context: context,
              postModel: postsList[index],
              commentController: commentController),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: postsList.length),
    );
