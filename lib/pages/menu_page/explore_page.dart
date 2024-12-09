import 'package:flutter/material.dart';
import 'package:yourdiary3/model/description_page.dart';
import 'package:yourdiary3/pages/profile/account_page.dart';
import 'package:yourdiary3/theme.dart';
import 'package:yourdiary3/model/card_item.dart';
import 'package:yourdiary3/model/card_widget.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    filteredCards = allCards;
    super.initState();
  }

  void _performSearch(String query) {
    List<CardItem> searchResults = allCards.where((card) {
      bool isTitleMatch =
          card.title.toLowerCase().contains(query.toLowerCase());
      bool isAuthorMatch =
          card.author.toLowerCase().contains(query.toLowerCase());
      bool isThemeMatch =
          card.category.toLowerCase().contains(query.toLowerCase());

      return isTitleMatch || isAuthorMatch || isThemeMatch;
    }).toList();

    setState(() {
      filteredCards = searchResults;
    });
  }

  void _navigateToDescriptionPage(CardItem card) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DescriptionPage(card: card),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // TOP BAR
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/logo.png", width: 50),
                  Text(
                    "Explore",
                    style:
                        boldTextStyle.copyWith(fontSize: 16, color: blueColor),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountPage()));
                        },
                        child: Image.asset("assets/akun.png")),
                  ),
                ],
              ),
            ),
            // TOP BAR
            // SEARCH BOX
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: blue2Color,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextField(
                    controller: _searchController,
                    style: regulerTextStyle.copyWith(color: blueColor),
                    cursorColor: blueColor,
                    onChanged: (query) {
                      _performSearch(query);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.search_sharp),
                        hintText: "Search",
                        hintStyle: regulerTextStyle.copyWith(
                            color: blueColor.withOpacity(0.5), fontSize: 14)),
                  ),
                ),
              ),
            ),
            // SEARCH BOX
            // CARD
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredCards.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToDescriptionPage(filteredCards[index]);
                  },
                  child: ExploreCardWidget(card: filteredCards[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
