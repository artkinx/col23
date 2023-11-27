import 'package:flutter/material.dart';

class TwoPageStateful extends StatefulWidget {
  const TwoPageStateful({Key? key}) : super(key: key);

  @override
  _TwoPageStatefulState createState() => _TwoPageStatefulState();
}

class _TwoPageStatefulState extends State<TwoPageStateful>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _buttonAnimation;
  late PageController _pageController;
  bool isReverse = false;
  double bottomButtonPosition = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _buttonAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _pageController = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void btnAction() {
    if (isReverse) {
      _onReverseButtonTap();
    } else {
      _onButtonTap();
    }
  }

  void _onButtonTap() {
    if (!isReverse) {
      // Animate the button to slide out
      _controller.forward().then((value) {
        // Animate the page transition to the next page
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        // // Reset the button animation
        // _controller.reset();
      });
      setState(() {
        bottomButtonPosition = (_buttonAnimation.value + 1) *
            (MediaQuery.of(context).size.height - 100);
        isReverse = true;
      });
    }
  }

  void _onReverseButtonTap() {
    if (isReverse) {
      // Animate the button to slide out
      _controller.reverse().then((value) {
        // Animate the page transition to the next page
        _pageController.previousPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        // Reset the button animation
        _controller.reset();
      });
      setState(() {
        isReverse = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // The page view that displays the two pages
          PageView(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            physics:
                const NeverScrollableScrollPhysics(), // Prevent the user from scrolling the page view
            children: [
              // The first page with a blue background
              Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'First Page',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // The second page with a green background
              Container(
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Second Page',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // The button that triggers the page transition
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1800),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            bottom:
                bottomButtonPosition, // Animate the bottom offset from 0 to -100
            child: Center(
              child: GestureDetector(
                onTap: btnAction,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_upward,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
