require 'csv'

class ParseOrderFile
    include Interactor

    def call
        # § is an unused character to workareound quotes on csv file
        itens = []
        ActiveRecord::Base.transaction do
            order = Order.create
            CSV.foreach(context.file.path, headers: true, quote_char: "§", col_sep: "\t") do |row|
                product = Product.find_or_create_by(description: row["Descrição"], price: row["Preço Unitário"]);
                supplier = Supplier.find_or_create_by(name: row["Fornecedor"], address: row["Endereço"])
                client = Client.find_or_create_by(name: row["Comprador"])
                item = Item.create(order: order, product: product, supplier: supplier, client: client, quantity: row["Quantidade"])
                unless item.persisted?
                    context.fail!(message: "Failed to parse CSV file.")
                end
                itens << item
                context.order = order
                context.itens = itens
            end
        end
    end
end
