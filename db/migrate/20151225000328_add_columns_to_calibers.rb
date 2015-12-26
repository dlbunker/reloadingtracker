class AddColumnsToCalibers < ActiveRecord::Migration
  def change
    remove_column :calibers, :diameter
    add_column :calibers, :metric, :decimal
    add_column :calibers, :inches, :decimal
    add_column :calibers, :cal_type, :string

    Caliber.create(name: '17 Remington', cal_type: 'RIFLE', metric: 17, inches: 0.172)
    Caliber.create(name: '17 Remington Fireball', cal_type: 'RIFLE', metric: 17, inches: 0.172)
    Caliber.create(name: '204 Ruger', cal_type: 'RIFLE', metric: 204, inches: 0.204)
    Caliber.create(name: '22 Bench Rest Remington', cal_type: 'RIFLE', metric: 22, inches: 0.224)
    Caliber.create(name: '22 Hornet', cal_type: 'RIFLE', metric: 22, inches: 0.224)
    Caliber.create(name: '22 PPC-USA', cal_type: 'RIFLE', metric: 22, inches: 0.224)
    Caliber.create(name: '22-250 Remington', cal_type: 'RIFLE', metric: 22, inches: 0.224)
    Caliber.create(name: '22-250 Remington Ackley Improved', cal_type: 'RIFLE', metric: 22, inches: 0.224)
    Caliber.create(name: '22-250 Remington Fast Twist', cal_type: 'RIFLE', metric: 22, inches: 0.224)
    Caliber.create(name: '221 Remington Fireball', cal_type: 'RIFLE', metric: 22, inches: 0.224)
    Caliber.create(name: '222 Remington', cal_type: 'RIFLE', metric: 22, inches: 0.224)
    Caliber.create(name: '222 Remington Magnum', cal_type: 'RIFLE', metric: 22, inches: 0.224)
    Caliber.create(name: '223 Remington', cal_type: 'RIFLE', metric: 22, inches: 0.224)
    Caliber.create(name: '223 Winchester Super Short Magnum', cal_type: 'RIFLE', metric: 22, inches: 0.224)
    Caliber.create(name: '225 Winchester', cal_type: 'RIFLE', metric: 22, inches: 0.224)
    Caliber.create(name: '5.56x45 NATO', cal_type: 'RIFLE', metric: 22, inches: 0.224)
  end
end
