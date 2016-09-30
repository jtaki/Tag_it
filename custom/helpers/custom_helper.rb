module Custom

  def recompile_custom_names
    add_ins = Roo::Spreadsheet.open('custom/output/rename_these.csv')


    Roo::Spreadsheet.open('custom/logs/custom.csv',"a", :row_sep => :auto) do |csv|
      add_ins.each do |line|
        csv << line
      end
    end


  end

end
