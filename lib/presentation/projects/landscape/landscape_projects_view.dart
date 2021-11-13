import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandscapeProjectsView extends StatelessWidget {
  const LandscapeProjectsView({
    Key key,
    @required ScrollController scrollController,
    @required this.myList,
    @required this.dynHeight,
    @required int currentMax,
  })  : _scrollController = scrollController,
        _currentMax = currentMax,
        super(key: key);

  final ScrollController _scrollController;
  final List myList;
  final double dynHeight;
  final int _currentMax;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        // itemExtent: 80,
        // +1 to show loading indicator

        itemBuilder: (context, i) {
          if (i == myList.length) {
            return CupertinoActivityIndicator();
          }
          return Container(
            width: double.infinity,
            height: dynHeight / 3.3,
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.white24, width: 3),
              top: BorderSide(color: Colors.white24, width: 3),
            )),
            // child: ListTile(
            //   title: Text(
            //     myList[i],
            //     style: TextStyle(
            //         fontWeight: FontWeight.w400,
            //         color: Colors.white),
            //   ),
            // ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment:
                  //     CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 200,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            // BorderRadius.circular(30),
                            BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0, 4))
                        ],
                      ),
                      // child: Center(
                      //   child: Text(
                      //     "Image",
                      //     style: TextStyle(
                      //         color: Colors.white),
                      //   ),
                      // ),
                      child: ClipRRect(
                        borderRadius:
                            // BorderRadius.circular(30),
                            BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                        child: Image.network(
                          "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAHlBMVEX09PTh4eH19fXg4ODk5OTw8PDs7Ozq6uru7u7n5+dZKxXMAAAELUlEQVR4nO2dWXKtMAwFwQMX9r/hB9RNMOARhCTyTv/kIxVQl4kHYZmuAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADgAsZ03o9eA6OfwyH360bXWz30kyd2HHvbq8LaibQdJ2V+C7Yf6RSdQsEZOxApGqWCsyJNK5qPVsEZCsHOS1tksBNFI2rsZTY8gaG0QxaCRjRj0ITS4/wvW0judguaKbjaID1f+xLEZG8/psZtV6OeKF3GbH2DHW9fbDN0WgTn/j0wvBtVYEjSM9MAwxZgKAMMW4ChDLyGxoQ/eGA0NMYPk3O9c9PH80nyGZo1A/e9l3WEiZM8DxmeZm3GH/Ib1jFNXZna0AzntTFZcigPj2E8f2M/HIoshqkEFYsih+Fu7b9XZOhvWNow4bdw85YVMBjmkqg0Kb4sHG2YaUKaFF+W5w3zefDnO5vnR/wwPxXh8YwOw1Oaz4Pbmzct8ryhLxhe+EdsivRxw/RgePW2821a/uZ5w8ILt/auZp7Ct8Qqb9g6/17XKA3BKnhK227yswirjvZtPc22yqwN912jxW6bQGW87xrx93mCuoBfNWs7JkKqIuaYeWcf04brn3ey1ITMsXrK7F9oWD1Ft+pUxPyeFXB8L1I5aJYsRnKbTcM9E5utyleQzUTVz2eSu8mKYb8km5jbLleI+xUZ4cJ+wHzgr8jqFzY85iNnfPe0vJn5uVff8mamuKMzGzrn27Xu9+3a4Bu2JddsWc3Erv4NaeWe3HTw6t9yV246Tkev3bB6V3UyfOWGDdvGU/HrNmzbFx8X0GzYvPE/asA14l+hubIhqqC4DS+UbsQc9Bpeq005S2g1vFx8c7LQani5uuikIWhohnR5wI3yqaOHnOG8ZLQpxVv1YYd1p5jhuiZOKN4sgNsrShl+F/0xxfsVfjtFoRE/yGqcfkdQwhgqyrRhmLY5tiJJjWbwvkfEcJeXOjyoNEWoVrYND4m3UJGqyla2DU+ZxUCRqoxY1DCWOv3pbsjqpCUNo4LfVqQrBBc0jAquioaylF/OMCG4KlKW8j9vmBjxk4LUSLUhm6CUIZ+gkCGjoIwhp6CIIaughCGvoIAhsyC/Ibcg+4jPLsjdhvyCzIYCgryGEoK8hoV93u83lDn+i9VQ4iGFIQwrDN2fN/z7bQhDGMIQhjCEYdnwvxrxPyKnljIadn6QgNOwMxKwGgoDwxZgKAMMW4ChDE/N2kiCoyA4eYTgPO/t/PPluyc6COrICc5kDybZ1jodhPP+u4LFg1qkofjXyR9jIgzFaaKl84Rkoen9FDci1Tmb0h5JqM6gNFo7m2R5zgVFbd8kW5nHZzJOx0MowNqhHHiL4+h2H7ARZvl4HvUHAtfD1yfpycyX6TPSfwCxE8o+JXhADwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAs/ANyGFT0fw3sTAAAAABJRU5ErkJggg==",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                  // width: ,
                                  width: double.infinity,
                                  child: Text(
                                    "Title Title Title Title Title Title Title Title ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  )),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              flex: 8,
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                    style: TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: _currentMax + 1,
      ),
    );
  }
}
