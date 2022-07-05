import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/pages/leagues/widgets/fixture_cards.dart';
import 'package:stake_lane_web_app/pages/exceptions/not_found.dart';
import 'package:stake_lane_web_app/api/fixtures/my_fixtures.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class LeaguePastDatesPageView extends StatelessWidget {
  const LeaguePastDatesPageView({super.key});

  @override
  Widget build(BuildContext context) {
   return Column(
      children: [
        Expanded(
          child: PaginatedPastFixtureListView(),
        ),
      ],
    );
  }
}

class PaginatedPastFixtureListView extends StatefulWidget {

  @override
  _PaginatedPastFixtureListViewState createState() =>
      _PaginatedPastFixtureListViewState();
}

class _PaginatedPastFixtureListViewState extends State<PaginatedPastFixtureListView> {
  static const _pageSize = 15;

  final PagingController<int, dynamic> _pagingController =
      PagingController(firstPageKey: -1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final content = await myFixtures(pageKey, _pageSize);
      List<dynamic> fixtures = content['fixtures'];

      final isLastPage = fixtures.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(fixtures);
      } else {
        final nextPageKey = pageKey - 1;
        _pagingController.appendPage(fixtures, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedListView<int, dynamic>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<dynamic>(
          itemBuilder: (context, item, index) => buildFixtureCard(item),
          noItemsFoundIndicatorBuilder: (_) {
            return NotFoundPageView(
              notFoundMessage:
                  'You can add leagues at edit screen',
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
