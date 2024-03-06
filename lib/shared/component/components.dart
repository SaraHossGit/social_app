import 'package:flutter/material.dart';
import 'package:social_app/shared/style/colors.dart';

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
  required String labelText,
  required TextEditingController controller,
  required String? Function(String?)? validator,
  VoidCallback? onSuffixPressed,
  bool isPasswordObscure = false,
  bool isPassword = false,
}) =>
    SizedBox(
      height: 50,
      child: TextFormField(
        obscureText: isPasswordObscure,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          label: Text(
            labelText,
            style:
                const TextStyle(color: Colors.white, fontFamily: "AvenirLight"),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: Colors.transparent, width: 1)),
          fillColor: Colors.white10.withOpacity(0.5),
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

// Widget defaultButton({
//   required String buttonText,
//   required VoidCallback onPressed,
//   double? width,
//   double? height,
// }) =>
//     Container(
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: buttonColor,
//       ),
//       child: MaterialButton(
//         height: height,
//         onPressed: onPressed,
//         child: Text(
//           buttonText,
//           style: const TextStyle(color: Colors.white, fontSize: 15),
//         ),
//       ),
//     );

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

Widget photosListBuilder({required List<dynamic> photosList}) => SizedBox(
      height: 150,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              photoItemBuilder(image: photosList[index]),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: photosList.length),
    );

Widget storyItemBuilder({required String image}) => CircleAvatar(
      radius: 30,
      child: CircleAvatar(
        radius: 28,
        backgroundImage: NetworkImage(
          image,
        ),
      ),
    );

Widget storiesListBuilder({required List<dynamic> storiesList}) => SizedBox(
      height: 60,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              storyItemBuilder(image: storiesList[index]),
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: 5),
    );
