module Custom

  def recompile_custom_names
    add_ins = Roo::Spreadsheet.open('custom/output/rename_these.csv')
      renamed = []
      2.upto(add_ins.last_row) do |line|
        item = []
        item << add_ins.cell('A', line)
        item << add_ins.cell('C', line)
        item << add_ins.cell('D', line)
        renamed << item
      end


    Roo::Spreadsheet.open('custom/logs/custom.csv',"a", :row_sep => :auto, csv_options: {encoding: Encoding::UTF-8}) do |csv|
      csv << renamed
    end


  end

end
