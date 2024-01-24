// ignore_for_file: must_be_immutable

part of 'wish_list_bloc.dart';

/// Represents the state of WishList in the application.
class WishListState extends Equatable {
  WishListState({
    this.filesizeController,
    this.wishListModelObj,
  });

  TextEditingController? filesizeController;

  WishListModel? wishListModelObj;

  @override
  List<Object?> get props => [
        filesizeController,
        wishListModelObj,
      ];
  WishListState copyWith({
    TextEditingController? filesizeController,
    WishListModel? wishListModelObj,
  }) {
    return WishListState(
      filesizeController: filesizeController ?? this.filesizeController,
      wishListModelObj: wishListModelObj ?? this.wishListModelObj,
    );
  }
}
