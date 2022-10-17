import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moffice_web/controllers/blocs/item_menu/item_menu.exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuLevelTwo extends StatefulWidget {

  final String iconName;
  final String title;
  final Function touched;
  final bool active;
  final bool isHovered;

  const MenuLevelTwo({
    Key? key,
    required this.iconName,
    required this.touched,
    required this.active,
    required this.title,
    required this.isHovered,
  }) : super(key: key);

  @override
  MenuLevelTwoState createState() => MenuLevelTwoState();

}

class MenuLevelTwoState extends State<MenuLevelTwo> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ItemMenuBloc(),
        child: BlocBuilder<ItemMenuBloc, ItemMenuState>(
          builder: (context, itemMenuState){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.size8, horizontal: Dimens.size16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(Dimens.size30),
                    child: InkWell(
                      onTap: () {
                        context.read<ItemMenuBloc>().add(ExpandMenu(expandMenu: !itemMenuState.expandMenu));
                      },
                      splashColor: Colors.white,
                      hoverColor: Colors.white12,
                      borderRadius: BorderRadius.circular(Dimens.size30),
                      child: Column(
                        children: [
                          Container(
                            height: Dimens.size50,
                            decoration: BoxDecoration(
                                color: widget.active ? Colors.white : Colors.transparent,
                                borderRadius: BorderRadius.circular(Dimens.size30)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: Dimens.size15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImagesNameConst.getSVG(widget.iconName),
                                    color: widget.active ? ColorConst.itemSidebarActive : ColorConst.itemSidebarInactive,
                                    width: Dimens.size16,
                                    height: Dimens.size16,
                                  ),
                                  Visibility(
                                      visible: widget.isHovered,
                                      child: const SizedBox(width: Dimens.size15)),
                                  Visibility(
                                    visible: widget.isHovered,
                                    child: Text(
                                      widget.title,
                                      style: TextStyle(
                                          fontSize: Dimens.size14,
                                          fontWeight: widget.active ? FontWeight.w600 : FontWeight.normal,
                                          color: widget.active ? ColorConst.itemSidebarActive : ColorConst.itemSidebarInactive
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const Spacer(),
                                  Visibility(
                                      visible: widget.isHovered,
                                      child: Container(
                                          margin: const EdgeInsets.only(right: Dimens.size16),
                                          child: !itemMenuState.expandMenu ? Icon(Icons.keyboard_arrow_down, color: ColorConst.itemSidebarInactive) : Icon(Icons.keyboard_arrow_up, color: ColorConst.itemSidebarInactive))
                                  )
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                              visible: itemMenuState.expandMenu && widget.isHovered,
                              child: Padding(
                                padding: const EdgeInsets.only(left: Dimens.size15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MenuItem(
                                        title: "Văn bản trình ký",
                                        padding: Dimens.size8,
                                        isSelected: itemMenuState.indexSelected == 1,
                                        onTap: (){
                                          // event selected item cha
                                          widget.touched();
                                          // event select item con
                                          context.read<ItemMenuBloc>().add(SelectItem(indexSelected: 1));
                                        }),
                                    MenuItem(
                                        title: "Văn bản xét duyệt",
                                        padding: Dimens.size8,
                                        isSelected: itemMenuState.indexSelected == 2,
                                        onTap: (){
                                          // event selected item cha
                                          widget.touched();
                                          // event select item con
                                          context.read<ItemMenuBloc>().add(SelectItem(indexSelected: 2));
                                        }),
                                    MenuItem(
                                        title: "Văn bản ký duyệt",
                                        padding: Dimens.size8,
                                        isSelected: itemMenuState.indexSelected == 3,
                                        onTap: (){
                                          // event selected item cha
                                          widget.touched();
                                          // event select item con
                                          context.read<ItemMenuBloc>().add(SelectItem(indexSelected: 3));
                                        }),
                                    MenuItem(
                                        title: "Văn bản ký nháy",
                                        padding: Dimens.size8,
                                        isSelected: itemMenuState.indexSelected == 4,
                                        onTap: (){
                                          // event selected item cha
                                          widget.touched();
                                          // event select item con
                                          context.read<ItemMenuBloc>().add(SelectItem(indexSelected: 4));
                                        }),
                                    MenuItem(
                                        title: "Văn bản ban hành",
                                        padding: Dimens.size8,
                                        isSelected: itemMenuState.indexSelected == 5,
                                        onTap: (){
                                          // event selected item cha
                                          widget.touched();
                                          // event select item con
                                          context.read<ItemMenuBloc>().add(SelectItem(indexSelected: 5));
                                        })
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
    );
  }
}

class MenuItem extends StatefulWidget {

  final Function onTap;
  final String title;
  final double padding;
  final bool isSelected;

  const MenuItem({
    Key? key,
    required this.title,
    this.padding = 0.0,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {

  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value){
          setState(() {
            value ? _isHovering = true : _isHovering = false;
          });
      },
      onTap: () {
        widget.onTap();
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.padding, top: widget.padding),
        child: Row(
          children: [
            Container(
              height: Dimens.size2,
              width: Dimens.size10,
              decoration: BoxDecoration(
                  color: (_isHovering || widget.isSelected) ? ColorConst.itemSidebarInactive : Colors.transparent
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: Dimens.size10),
                child: Text(
                    widget.title,
                    style: TextStyle(
                        color: widget.isSelected ? Colors.white : ColorConst.itemSidebarInactive,
                        fontSize: Dimens.size13,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
