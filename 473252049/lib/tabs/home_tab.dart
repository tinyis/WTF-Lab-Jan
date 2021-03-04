import 'package:chat_journal/pages/category/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/category_bloc/category_bloc.dart';
import '../blocs/home_page_bloc/homepage_bloc.dart';
import '../widgets/category_widget.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = BlocProvider.of<HomepageBloc>(context).categories;

    return BlocBuilder<HomepageBloc, HomepageState>(
      builder: (context, state) {
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) => BlocProvider<CategoryBloc>(
            create: (context) => CategoryBloc(categories[index]),
            child: BlocProvider(
              create: (context) => CategoryCubit(state.categories[index]),
              child: CategoryWidget(categories[index]),
            ),
          ),
          itemCount: categories.length,
        );
      },
    );
  }
}
