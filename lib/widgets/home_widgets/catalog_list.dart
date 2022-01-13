import 'package:fashoon/models/cart.dart';
import 'package:fashoon/models/catalog.dart';
import 'package:fashoon/screens/home_details_page.dart';
import 'package:fashoon/screens/home_screen.dart';
import 'package:fashoon/widgets/home_widgets/add_to_cart.dart';
import 'package:fashoon/widgets/home_widgets/catalog_image.dart';
import 'package:fashoon/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailsScreen(
                          catalog: catalog,
                        ))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(
            image: catalog.image!,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.title!.text.lg.color(context.accentColor).bold.make(),
            catalog.description!.text
                .textStyle(context.captionStyle!)
                .overflow(TextOverflow.ellipsis)
                .make(),
            10.heightBox,
            ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(catalog: catalog)
                ]).pOnly(right: 8.0),
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}
