import 'package:flutter/material.dart';

class AppTicketTabs extends StatefulWidget {
  final String firstTab;
  final String secondTab;

  const AppTicketTabs({
    super.key,
    required this.firstTab,
    required this.secondTab,
  });

  @override
  State<AppTicketTabs> createState() => _AppTicketTabsState();
}

class _AppTicketTabsState extends State<AppTicketTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xFFF4F6FD),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: AppTab(
                  tabText: widget.firstTab,
                  isSelected: selectedIndex == 0,
                  isLeft: true,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: AppTab(
                  tabText: widget.secondTab,
                  isSelected: selectedIndex == 1,
                  isLeft: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppTab extends StatelessWidget {
  final String tabText;
  final bool isSelected;
  final bool isLeft;

  const AppTab({
    super.key,
    required this.tabText,
    required this.isSelected,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: isLeft
            ? const BorderRadius.horizontal(left: Radius.circular(50))
            : const BorderRadius.horizontal(right: Radius.circular(50)),
      ),
      alignment: Alignment.center,
      child: Text(
        tabText,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
