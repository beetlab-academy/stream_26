//
//  TableViewConrtoller.swift
//  tableView
//
//  Created by Andrei Konoplev on 06.12.2020.
//

import UIKit

class TableViewConrtoller: UIViewController {
    
    let customCellIdentifier = "customTableViewCell"
    let textTavbleViewCellIdentifier = "textTableViewCell"
    
    fileprivate let dataSource: [DialogModel] = [
        DialogModel(name: "Andrei Konoplev", preview: "Привет! Как дела?"),
        DialogModel(name: "Denis Kravets", preview: "Привет!"),
        DialogModel(name: "Vladimir Putin", preview: "Ты че делаешь козлина"),
        DialogModel(name: "Nikita Promchik", preview: "Во сколько сбор"),
        DialogModel(name: "Vlad Shaigu", preview: "Привет! Пока не родила")
    ]
    
    fileprivate let textDataSource: [TextModel] = [
        TextModel(text: "sdfadsfsdaf"),
        TextModel(text: "Текст, очень много какого-то теста Текст, очень много какого-то теста Текст, очень много какого-то теста Текст, очень много какого-то теста Текст, очень много какого-то теста Текст, очень много какого-то теста Текст, очень много какого-то теста Текст, очень много какого-то теста Текст, очень много какого-то теста Текст, очень много какого-то теста Текст, очень много какого-то теста Текст, очень много какого-то теста Текст, очень много какого-то теста"),
        TextModel(text: "Мы не подходим к тому дому потому что там очень большой процент обрушения здания.")
    ]
    

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            
            tableView.delegate = self
            tableView.dataSource = self
            registerNib()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //вызывается перед тем как вью контроллер покажется на экране
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //вызывается после того как вью контроллер появился на экране
    }
}

extension TableViewConrtoller: UITableViewDelegate, UITableViewDataSource {
    
    //Количество секций в таблице
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //Количесто ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return dataSource.count
        } else {
            return textDataSource.count
        }
        
    }
    
    //вызывается перед тем как подойдет ее очередь для отобржения. Здесь мы создаем ячейку, кофингурируем ее и возвращаем в таблицу.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            //3. Достаем нашу ячейку из таблицы по идентификатору
            let cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier, for: indexPath) as! CustomTableViewCell
            let model = dataSource[indexPath.row]
            print("номер секции \(indexPath.section) и индекс ячейки \(indexPath.row)")
            cell.configure(with: model)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: textTavbleViewCellIdentifier, for: indexPath) as! TextTableViewCell
            let model = textDataSource[indexPath.row]
            cell.configure(with: model)
            return cell
        }
    }
    
    //какой высоты должна быть ячейка для определенного indexPath
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 120
        } else {
            return UITableView.automaticDimension
        }
    }
    
    //В загаловок хедера секции какой текст надо написать
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Диалоги"
        } else {
            return "Текста"
        }
    }
}

extension TableViewConrtoller {
    fileprivate func registerNib() {
        
        //1. Создаем ниб
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        //2. Регистрируем его в таблицу по идентификатору
        tableView.register(nib, forCellReuseIdentifier: customCellIdentifier)
        
        let textNib = UINib(nibName: "TextTableViewCell", bundle: nil)
        tableView.register(textNib, forCellReuseIdentifier: textTavbleViewCellIdentifier)
    }
}
