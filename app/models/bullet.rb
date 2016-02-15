class Bullet < Trait
  default_scope { where(:attr_name => TYPE_BULLET) }
end
