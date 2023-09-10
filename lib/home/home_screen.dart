import 'package:api_exam/core/cubit/api_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiCubit, ApiState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 1,
          child: Scaffold(
            backgroundColor: Colors.grey,
            appBar: AppBar(
              bottom: const TabBar(tabs: [
                Tab(
                  child: Text('Cats'),
                ),
              ]),
              title: const Text('Flutter Cat App Toy'),
              actions: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<ApiCubit>(context).getData();
                  },
                  icon: const Icon(Icons.downloading),
                )
              ],
            ),
            body: state is! DataLoadingState
                ? GridView.count(
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 4.0,
                    children: List.generate(10, (index) {
                      return Tooltip(

                        decoration: const BoxDecoration(color: Colors.grey,),

                        message:
                            BlocProvider.of<ApiCubit>(context).data1[index].id,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          height: 200,
                          width: 135,
                          child: GestureDetector(
                              onTap: () {},
                              child: Image.network(
                                  BlocProvider.of<ApiCubit>(context)
                                      .data1[index]
                                      .url)),
                        ),
                      );
                    }))
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
    );
  }
}
