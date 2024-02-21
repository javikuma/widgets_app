import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];

  final ScrollController scrollController = ScrollController();

  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      // scrollController.position.pixels; // posicion actual
      // scrollController.position.maxScrollExtent; // posicion maxima
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // Load next page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;
    if (!isMounted)
      return; // el isMounted se coloca en false en el dispose para saber que el widget está destruido

    setState(() {});

    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    final lastId = imagesIds.last;
    isLoading = false;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
  }

  // mover el scroll un poco para abajo cuando se carguen nuevas imagenes para avisar al usuario "hey!! hay nuevas imagenes"
  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    // imagesIds.add(lastId + 1);
    // imagesIds.add(lastId + 2);
    // imagesIds.add(lastId + 3);
    // ... 👇

    imagesIds.addAll([1, 2, 3, 4, 5].map(
      (e) => lastId + e,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Infinite Scroll'),
      // ),
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10, // bajar un poco el refresher
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        // child: const Icon(Icons.arrow_back_ios_new_outlined)),
        // child: CircularProgressIndicator()),
        child: isLoading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded))
            : FadeIn(
                child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 20,
              )),
      ),
    );
  }
}
