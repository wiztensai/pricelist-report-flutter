int totalHargaPerbulan(int totalKaryawan) {
  if(totalKaryawan < 50) {
    return 20000;
  }

  if(totalKaryawan < 199) {
    return 18000;
  }

  if(totalKaryawan < 350) {
    return 15000;
  }

  if(totalKaryawan < 500) {
    return 8500;
  }

  if(totalKaryawan < 1000) {
    return 7000;
  }

  if(totalKaryawan >= 1000) {
    return 5500;
  }
}