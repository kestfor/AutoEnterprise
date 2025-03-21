import 'package:flutter/material.dart';
import '../../generated/transport_service.pb.dart';
import '../../persons/utils/utils.dart';
import '../../utils/utils.dart';

class GarageCard extends StatelessWidget {
  final GarageFacility garage;
  final Function? onGarageSelected;

  const GarageCard({Key? key, this.onGarageSelected, required this.garage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onGarageSelected != null) {
          onGarageSelected!(garage);
        }
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [Colors.blueGrey.shade50, Colors.blueGrey.shade100], // Постельные тона
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.garage, // Иконка гаража
                    size: 32,
                    color: Colors.blueGrey.shade800, // Темный цвет иконки
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        garage.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade900, // Темный цвет текста
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        formatType(garage.type),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey.shade800, // Средний цвет текста
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        garage.address,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueGrey.shade600, // Светлый цвет текста
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GarageListWidget extends StatelessWidget {
  final List<GarageFacility> garages;
  final Function? onGarageSelected;

  const GarageListWidget({Key? key, this.onGarageSelected, required this.garages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Одна карточка в строке
            crossAxisSpacing: 10,
            mainAxisSpacing: 8,
            childAspectRatio: 3, // Соотношение сторон карточки
          ),
          itemCount: garages.length,
          itemBuilder: (context, index) {
            var garage = garages[index];
            return GarageCard(
              garage: garage,
              onGarageSelected: onGarageSelected,
            );
          },
        ),
      ),
    );
  }
}