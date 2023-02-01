String getSpritesById(int id) =>
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$id.png';

String getHeightInMeters(double height) => '${height / 10} m';

String getWeightInKg(double weight) => '${weight / 10} kg';
