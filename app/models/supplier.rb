class Supplier < ActiveRecord::Base

  has_many :drugs
  has_many :suppliers_institutions


  after_initialize :set_values, if: :new_record?

  def set_values
    self.supplier_code ||= generate_supplier_code
  end

  def generate_supplier_code
    code = loop do
      l = ('A'..'Z').to_a
      l.delete('I')
      l.delete('O')
      l.delete('L')
      lt = l.shuffle[0..0].join
      n = (0..9).to_a.shuffle[0..2].join
      code = lt + n
      break code unless Supplier.exists?(supplier_code: code)
    end
  end


end
