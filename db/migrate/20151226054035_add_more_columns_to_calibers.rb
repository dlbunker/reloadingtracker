class AddMoreColumnsToCalibers < ActiveRecord::Migration
  def change
    # add_column :calibers, :mm, :decimal

    Caliber.create(name: '240 Weatherby Magnum', cal_type: 'RIFLE', metric: 240, inches: 0.243, mm: 6)
    Caliber.create(name: '243 Winchester', cal_type: 'RIFLE', metric: 240, inches: 0.243, mm: 6)
    Caliber.create(name: '243 Winchester Super Short Magnum', cal_type: 'RIFLE', metric: 240, inches: 0.243, mm: 6)
    Caliber.create(name: '6mm Bench Rest Remington', cal_type: 'RIFLE', metric: 240, inches: 0.243, mm: 6)
    Caliber.create(name: '6mm PPC-USA', cal_type: 'RIFLE', metric: 240, inches: 0.243, mm: 6)
    Caliber.create(name: '6mm Remington', cal_type: 'RIFLE', metric: 240, inches: 0.243, mm: 6)

    Caliber.create(name: '25 Winchester Super Short Magnum', cal_type: 'RIFLE', metric: 25, inches: 0.257)
    Caliber.create(name: '25-06 Remington', cal_type: 'RIFLE', metric: 25, inches: 0.257)
    Caliber.create(name: '250 Savage', cal_type: 'RIFLE', metric: 25, inches: 0.257)
    Caliber.create(name: '257 Roberts', cal_type: 'RIFLE', metric: 25, inches: 0.257)
    Caliber.create(name: '257 Roberts Ackley Improved', cal_type: 'RIFLE', metric: 25, inches: 0.257)
    Caliber.create(name: '257 Weatherby Magnum', cal_type: 'RIFLE', metric: 25, inches: 0.257)

    Caliber.create(name: '26 Nosler', cal_type: 'RIFLE', metric: 26, inches: 0.264, mm: 6.5)
    Caliber.create(name: '260 Remington', cal_type: 'RIFLE', metric: 26, inches: 0.264, mm: 6.5)
    Caliber.create(name: '264 Winchester Magnum', cal_type: 'RIFLE', metric: 26, inches: 0.264, mm: 6.5)
    Caliber.create(name: '6.5 Creedmoor', cal_type: 'RIFLE', metric: 26, inches: 0.264, mm: 6.5)
    Caliber.create(name: '6.5 Grendel', cal_type: 'RIFLE', metric: 26, inches: 0.264, mm: 6.5)
    Caliber.create(name: '6.5 Remington Magnum', cal_type: 'RIFLE', metric: 26, inches: 0.264, mm: 6.5)
    Caliber.create(name: '6.5mm-06 A-Square', cal_type: 'RIFLE', metric: 26, inches: 0.264, mm: 6.5)
    Caliber.create(name: '6.5-284 Norma', cal_type: 'RIFLE', metric: 26, inches: 0.264, mm: 6.5)
    Caliber.create(name: '6.5 X 55 Swedish Mauser', cal_type: 'RIFLE', metric: 26, inches: 0.264, mm: 6.5)

    Caliber.create(name: '6.8 Remington SPC', cal_type: 'RIFLE', metric: 270, inches: 0.277, mm: 6.8)

    Caliber.create(name: '270 Weatherby Magnum', cal_type: 'RIFLE', metric: 270, inches: 0.277)
    Caliber.create(name: '270 Winchester', cal_type: 'RIFLE', metric: 270, inches: 0.277)
    Caliber.create(name: '270 Winchester Short Magnum', cal_type: 'RIFLE', metric: 270, inches: 0.277)

    Caliber.create(name: '28 Nosler', cal_type: 'RIFLE', metric: 28, inches: 0.284, mm: 7)
    Caliber.create(name: '280 Remington', cal_type: 'RIFLE', metric: 28, inches: 0.284, mm: 7)
    Caliber.create(name: '280 Remington Ackley Improved', cal_type: 'RIFLE', metric: 28, inches: 0.284, mm: 7)
    Caliber.create(name: '284 Winchester', cal_type: 'RIFLE', metric: 28, inches: 0.284, mm: 7)
    Caliber.create(name: '7mm Remington Magnum', cal_type: 'RIFLE', metric: 28, inches: 0.284, mm: 7)
    Caliber.create(name: '7mm Remington Ultra Magnum', cal_type: 'RIFLE', metric: 28, inches: 0.284, mm: 7)
    Caliber.create(name: '7mm Remington Short Action Ultra Magnum', cal_type: 'RIFLE', metric: 28, inches: 0.284, mm: 7)
    Caliber.create(name: '7mm Shooting Times Westerner', cal_type: 'RIFLE', metric: 28, inches: 0.284, mm: 7)
    Caliber.create(name: '7mm Weatherby Magnum', cal_type: 'RIFLE', metric: 28, inches: 0.284, mm: 7)
    Caliber.create(name: '7mm Winchester Short Magnum', cal_type: 'RIFLE', metric: 28, inches: 0.284, mm: 7)
    Caliber.create(name: '7mm-08 Remington', cal_type: 'RIFLE', metric: 28, inches: 0.284, mm: 7)
    Caliber.create(name: '7mm Mauser (7x57)', cal_type: 'RIFLE', metric: 28, inches: 0.284, mm: 7)

    Caliber.create(name: '30 Thompson Center', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '30-06 Springfield', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '30-06 Springfield Ackley Improved', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '30-30 Winchester', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '30/40 Krag', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '30-378 Weatherby Magnum', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '300 AAC Blackout', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '300 Holland & Holland (H&H) Magnum', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '300 Remington Short Action Ultra Magnum', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '300 Remington Ultra Magnum', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '300 Ruger Compact Magnum', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '300 Savage', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '300 Weatherby Magnum', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '300 Winchester Magnum', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '300 Winchester Short Magnum', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '308 Marlin Express', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '308 Norma Magnum', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '308 Winchester', cal_type: 'RIFLE', metric: 30, inches: 0.308)
    Caliber.create(name: '7.62x51mm NATO', cal_type: 'RIFLE', metric: 30, inches: 0.308)

    Caliber.create(name: '325 Winchester Short Magnum', cal_type: 'RIFLE', metric: 325, inches: 0.323, mm: 8)
    Caliber.create(name: '8mm Remington Magnum', cal_type: 'RIFLE', metric: 325, inches: 0.323, mm: 8)
    Caliber.create(name: '8mm-06', cal_type: 'RIFLE', metric: 325, inches: 0.323, mm: 8)
    Caliber.create(name: '8x57mm JS Mauser', cal_type: 'RIFLE', metric: 325, inches: 0.323, mm: 8)

    Caliber.create(name: '330 Dakota', cal_type: 'RIFLE', metric: 33, inches: 0.338)
    Caliber.create(name: '338 Federal', cal_type: 'RIFLE', metric: 33, inches: 0.338)
    Caliber.create(name: '338 Lapua Magnum', cal_type: 'RIFLE', metric: 33, inches: 0.338)
    Caliber.create(name: '338 Remington Ultra Magnum', cal_type: 'RIFLE', metric: 33, inches: 0.338)
    Caliber.create(name: '338 Winchester Magnum', cal_type: 'RIFLE', metric: 33, inches: 0.338)
    Caliber.create(name: '338-06 A-Square', cal_type: 'RIFLE', metric: 33, inches: 0.338)
    Caliber.create(name: '338-378 Weatherby Magnum', cal_type: 'RIFLE', metric: 33, inches: 0.338)
    Caliber.create(name: '340 Weatherby Magnum', cal_type: 'RIFLE', metric: 33, inches: 0.338)

    Caliber.create(name: '35 Whelen', cal_type: 'RIFLE', metric: 35, inches: 0.358)
    Caliber.create(name: '350 Remington Magnum', cal_type: 'RIFLE', metric: 35, inches: 0.358)
    Caliber.create(name: '358 Norma Magnum', cal_type: 'RIFLE', metric: 35, inches: 0.358)
    Caliber.create(name: '358 Shooting Times Alaskan', cal_type: 'RIFLE', metric: 35, inches: 0.358)
    Caliber.create(name: '358 Winchester', cal_type: 'RIFLE', metric: 35, inches: 0.358)

    Caliber.create(name: '9.3 X 62 Mauser', cal_type: 'RIFLE', metric: 36, inches: 0.366, mm: 9.3)
    Caliber.create(name: '9.3x64mm Brenneke', cal_type: 'RIFLE', metric: 36, inches: 0.366, mm: 9.3)
    Caliber.create(name: '9.3x74 R', cal_type: 'RIFLE', metric: 36, inches: 0.366, mm: 9.3)

    Caliber.create(name: '375 Holland & Holland (H&H) Magnum', cal_type: 'RIFLE', metric: 375, inches: 0.375)
    Caliber.create(name: '375 Remington Ultra Magnum', cal_type: 'RIFLE', metric: 375, inches: 0.375)
    Caliber.create(name: '375 Ruger', cal_type: 'RIFLE', metric: 375, inches: 0.375)
    Caliber.create(name: '378 Weatherby Magnum', cal_type: 'RIFLE', metric: 375, inches: 0.375)

    Caliber.create(name: '416 Remington Magnum', cal_type: 'RIFLE', metric: 416, inches: 0.416)
    Caliber.create(name: '416 Rigby', cal_type: 'RIFLE', metric: 416, inches: 0.416)
    Caliber.create(name: '416 Ruger', cal_type: 'RIFLE', metric: 416, inches: 0.416)
    Caliber.create(name: '416 Weatherby Magnum', cal_type: 'RIFLE', metric: 416, inches: 0.416)

    Caliber.create(name: '44 Remington Magnum', cal_type: 'RIFLE', metric: 44, inches: 0.429)

    Caliber.create(name: "45-70 Gov't (Strong Actions Only)", cal_type: 'RIFLE', metric: 458, inches: 0.458)
    Caliber.create(name: '458 Lott', cal_type: 'RIFLE', metric: 458, inches: 0.458)
    Caliber.create(name: '458 Winchester Magnum', cal_type: 'RIFLE', metric: 458, inches: 0.458)

    Caliber.create(name: '357 Sig', cal_type: 'HANDGUN', metric: 357, inches: 0.355, mm: 9)
    Caliber.create(name: '380 Auto (ACP)', cal_type: 'HANDGUN', metric: 357, inches: 0.355, mm: 9)
    Caliber.create(name: '9mm Luger (Parabellum)', cal_type: 'HANDGUN', metric: 357, inches: 0.355, mm: 9)

    Caliber.create(name: '38 Special', cal_type: 'HANDGUN', metric: 38, inches: 0.357)
    Caliber.create(name: '357 Magnum', cal_type: 'HANDGUN', metric: 38, inches: 0.357)
    Caliber.create(name: '357 Remington Maximum', cal_type: 'HANDGUN', metric: 38, inches: 0.357)

    Caliber.create(name: '40 S&W', cal_type: 'HANDGUN', metric: 40, inches: 0.400, mm: 10)
    Caliber.create(name: '10mm Auto', cal_type: 'HANDGUN', metric: 40, inches: 0.400, mm: 10)

    Caliber.create(name: '41 Remington Magnum', cal_type: 'HANDGUN', metric: 41, inches: 0.410)

    Caliber.create(name: '44 Remington Magnum', cal_type: 'HANDGUN', metric: 44, inches: 0.429)
    Caliber.create(name: '44 Special', cal_type: 'HANDGUN', metric: 44, inches: 0.429)

    Caliber.create(name: '45 Auto (ACP)', cal_type: 'HANDGUN', metric: 45, inches: 0.451)
    Caliber.create(name: '45 Colt (Ruger & T/C Contender & Encore)', cal_type: 'HANDGUN', metric: 45, inches: 0.451)
    Caliber.create(name: '45 Colt (Single Action Army & Replicas)', cal_type: 'HANDGUN', metric: 45, inches: 0.451)
  end
end
