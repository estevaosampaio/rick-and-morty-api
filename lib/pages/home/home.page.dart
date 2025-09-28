import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_morty_app/pages/home/stores/home.store.dart';
import 'package:rick_morty_app/pages/home/widgets/characters_grid_view.widget.dart';
import 'package:rick_morty_app/pages/home/widgets/characters_list_view.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeStore = HomeStore();

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    homeStore.loadData();
    scrollController.addListener(scrollControllerLoadMore);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollControllerLoadMore() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      homeStore.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Rick and Morty',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Procure pelo seu personagem',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                key: Key("Filtro"),
                decoration: InputDecoration(
                  hintText: 'Nome ou identificador',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: homeStore.setSearch,
              ),
              SizedBox(height: 10),
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: IconButton(
                  onPressed: homeStore.toggleShowInList,
                  icon: Observer(
                    builder: (_) {
                      return Icon(
                        homeStore.showInList ? Icons.grid_view : Icons.list,
                        size: 32,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Observer(
                  builder: (_) {
                    return homeStore.showInList
                        ? CharactersListView(
                            homeStore: homeStore,
                            scrollController: scrollController,
                          )
                        : CharactersGridView(
                            homeStore: homeStore,
                            scrollController: scrollController,
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
