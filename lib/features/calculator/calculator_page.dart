import 'package:flutter/material.dart';
import 'package:halkculator/core/data/saved_positions_repository.dart';
import 'package:halkculator/core/data/stock_position.dart';
import 'package:halkculator/core/theme/app_sizes.dart';
import 'package:halkculator/core/widgets/empty_state.dart';
import 'package:halkculator/features/calculator/limit_projection.dart';
import 'package:halkculator/features/calculator/widgets/limit_direction_style.dart';
import 'package:halkculator/features/calculator/widgets/limit_projection_card.dart';
import 'package:halkculator/features/calculator/widgets/position_form.dart';
import 'package:halkculator/l10n/app_localizations.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.savedPositions});

  final SavedPositionsRepository savedPositions;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  StockPosition? _position;

  Future<void> _save(StockPosition position) async {
    await widget.savedPositions.add(position);
    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).savedMessage)),
      );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final position = _position;

    return DefaultTabController(
      length: LimitDirection.values.length,
      child: Scaffold(
        floatingActionButton: position == null
            ? null
            : FloatingActionButton(
                tooltip: l10n.saveTooltip,
                onPressed: () => _save(position),
                child: const Icon(Icons.save),
              ),
        body: Padding(
          padding: const EdgeInsets.all(AppSizes.spacingSmall),
          child: Column(
            children: [
              PositionForm(
                onSubmitted: (position) => setState(() => _position = position),
              ),
              const SizedBox(height: AppSizes.spacingSmall),
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                tabs: [
                  for (final direction in LimitDirection.values)
                    Tab(
                      icon: Icon(
                        direction.icon,
                        color: direction.color,
                        size: 30,
                        semanticLabel: direction.label(l10n),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: AppSizes.spacingMedium),
              Expanded(
                child: TabBarView(
                  children: [
                    for (final direction in LimitDirection.values)
                      position == null
                          ? const EmptyState()
                          : _ProjectionList(
                              position: position,
                              direction: direction,
                            ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectionList extends StatelessWidget {
  const _ProjectionList({required this.position, required this.direction});

  final StockPosition position;
  final LimitDirection direction;

  // Leaves room under the last card for the floating save button.
  static const _bottomPadding = 88.0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: _bottomPadding),
      itemCount: projectedDayCount,
      separatorBuilder: (_, _) => const SizedBox(height: AppSizes.spacingSmall),
      itemBuilder: (context, index) => LimitProjectionCard(
        projection: LimitProjection.calculate(
          position: position,
          direction: direction,
          day: index + 1,
        ),
      ),
    );
  }
}
