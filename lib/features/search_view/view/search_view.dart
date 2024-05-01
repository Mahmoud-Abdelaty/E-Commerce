part of 'widgets/widgets.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(SearchRepoImplement()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Search',
        ),
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return Column(
              children: [
                SearchBox(
                  enabled: true,
                  onChanged: (value) {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchProductEvent(value));
                  },
                ),
                if (state is SearchSuccess) ...[
                  state.data.isNotEmpty
                      ? SearchBoxResult(productModel: state.data)
                      : const EmptySearch(),
                ] else if (state is SearchLoading) ...[
                  const Text('Loading...'),
                ] else ...[
                  const Text('No results found'),
                ]
              ],
            );
          },
        ),
      ),
    );
  }
}