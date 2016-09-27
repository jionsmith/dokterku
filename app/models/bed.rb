class Bed < ActiveRecord::Base


  after_initialize :set_values, :if => :new_record?


  private

    def set_values
      self.vvip_free = self.vvip
      self.vip_free = self.vip
      self.i_free = self.i
      self.ii_free = self.ii
      self.iii_free = self.iii
      self.ruang_isolasi_free = self.ruang_isolasi
      self.igd_free = self.igd
      self.vk_free = self.vk
      self.ok_free = self.ok
      self.perinatologi_free = self.perinatologi
    end




end