import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:space_app/core/app_colors/appColors.dart';
import 'package:space_app/core/utils/platform_helper.dart';
import 'package:space_app/features/planets_exploration/presentation/controller/planets_cubit.dart';
import 'package:space_app/features/planets_exploration/presentation/controller/planets_state.dart';
import 'package:space_app/features/planets_exploration/presentation/screens/planet_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
    context.read<PlanetsCubit>().fetchPlanets();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff030A10),
      body: BlocBuilder<PlanetsCubit, PlanetsState>(
        builder: (context, state) {
          if (state is PlanetsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xffE64A19)),
            );
          } else if (state is PlanetsSuccess) {
            final currentPlanet = state.planets[state.currentPlanetIndex];

            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: size.height * 0.28,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/top_background.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Color(0xcc030A10)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.05,
                  left: size.width * 0.38,
                  right: 20,
                  child: const Text(
                    "Explore",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.1,
                  left: 24,
                  right: 24,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 75),
                      Text(
                        "Which planet\nwould you like to explore?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: size.height * 0.3,
                  left: 0,
                  right: 0,
                  height: size.height * 0.4,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: state.planets.length,
                    onPageChanged: (index) {
                      context.read<PlanetsCubit>().updateCurrentPlanetIndex(
                        index,
                      );
                    },
                    itemBuilder: (context, index) {
                      final planet = state.planets[index];
                      return AnimatedScale(
                        scale: state.currentPlanetIndex == index ? 1.0 : 0.85,
                        duration: const Duration(milliseconds: 300),
                        child: shouldShow3DModel
                            ? ModelViewer(
                                key: ValueKey(planet.name),
                                src: planet.glbModel,
                                autoRotate: true,
                                cameraControls: true,
                                backgroundColor: Colors.transparent,
                                disableZoom: true,
                              )
                            : Image.asset(planet.pngImage, fit: BoxFit.contain),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.18,
                  left: 24,
                  right: 24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (state.currentPlanetIndex > 0) {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.red,
                          padding: const EdgeInsets.all(12),
                        ),
                      ),
                      Text(
                        currentPlanet.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (state.currentPlanetIndex <
                              state.planets.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.red,
                          padding: const EdgeInsets.all(12),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.06,
                  left: 24,
                  right: 24,
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                PlanetDetailsPage(planet: currentPlanet),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              "Explore ${currentPlanet.name}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is PlanetsError) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
