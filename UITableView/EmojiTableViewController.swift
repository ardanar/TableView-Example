//
//  EmojiTableViewController.swift
//  UITableView
//
//  Created by Arda Nar on 15.12.2022.
//

import UIKit

// UITableViewDataSource && UITableViewDelegate
class EmojiTableViewController: UITableViewController {
    
    // MARK: - Properties
    var emojis: [Emoji] = [
        
        Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happines"),
        Emoji(symbol: "😟", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happines"),
        Emoji(symbol: "😟", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happines"),
        Emoji(symbol: "😟", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happines"),
        Emoji(symbol: "😟", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happines"),
        Emoji(symbol: "😟", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happines"),
        Emoji(symbol: "😟", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happines"),
        Emoji(symbol: "😟", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happines"),
        Emoji(symbol: "😟", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow")
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEmojiEdit"{
            // O an seçili olan hücrenin IndexPath değerini verir.
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            
            // O an seçili olan index ile 'emojis' array'inden ilgili objeye ulaşılır.
            let selectedEmoji = emojis[selectedIndexPath.row]
            
            // Segue'nin Storyboard'da bağlı olduğu yer bir NavigationController...
            let navigationController = segue.destination as! UINavigationController
            
            // NaviigationController'ın topViewController (kendisine bağlı olan ilk sayfa) ulaşılır.
            let editEmojiController = navigationController.topViewController as! NewEmojiTableViewController
            
            // Gidilecek sayfada bulunan 'emoji' değişkenini doldurur.
            editEmojiController.emoji = selectedEmoji
            
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // 1 section varsa yazmaya gerek yok çünkü varsayılan 1
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Her section için 1 kez çalışıyor. Örneğin, 4 section'a sahip bir tableView varsa,
        // Bu fonksiyon her section için 1 kez olmak üzere toplam 4 kez çalışacaktır.
        // section parametresi, o an çizilmekte olan section bilgisini verir.
        return emojis.count  // Elimizdeki emoji sayısı kadar hücre oluşturur.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Bir hücre, ne zamanki ekrana gelecek; cellForRow ile çizilir.
        // Bu fonksiyon kaç kez çalışacağı belli değildir.
        // Örnek 1: Kullanıcı hiç scrool etmez ise, ekranda görünebilen olan hücre sayısı kadar çalışır.
        // Örnek 2: Kullanıcı scrool etmeye başlarsa scrool ettiği sürece bu fonksiyon çalışır.
        
        // indexPath: O an çizilmekte olan hücrenin konum bilgisi.
        // Adım 1: O an çizilmekte olan emoji nesnesine indexPath değeri ile ulaşmak.
        let emoji = emojis[indexPath.row]
        
        // Adım 2: Hücre Oluşturmak
        // reuseIdentifier: Storyboard'da hücre için verdiğniz identifier değeri.
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell") as! EmojiTableViewCell
        
        // Adım 3: Hücreyi data ile doldurmak
        /* cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"  // Title
           cell.detailTextLabel?.text = emoji.description */  // Subtitle
        cell.update(with: emoji)
        
        // Adım 4: Return etmek.
        return cell
        
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Bu fonksiyon, kullanıcı bir hücrenizi seçtiği zaman (üstüne tıklandığı zaman) çalışır.
        // indexPath: Üzerine tıklanılan hücrenin konum bilgisi.
        
        // indexPath'in row property'sini kullanarak üerine tıklanan emoji nesnesine ulaşılabilir.
        let selectedEmoji = emojis[indexPath.row]
        
        // Storyboard'da 'toEmojiEdit' adına sahip alan segue çalıştırılır.
        performSegue(withIdentifier: "toEditEmoji", sender: nil)
        print("\(selectedEmoji.symbol) \(indexPath)")
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // sourceIndexPath: Sırası değiştirilmek istenen hücrenin konumu.
        // destinationIndexPath: Gidilmesi istenilen konum. (Parmak ekran kaldırılınca)
        
        // ÇOK ÖNEMLİ: 'emojis' array'in, tableView hücre sırası ile her zaman aynı kalması gerekir.
        // Bu senkronu sağlayabilmek için hareket ettirilen objenin, array'de de konumu değiştirilir.
        
        // Adım 1: Hareket ettirilen emoji nesnesine ulaşmak ve array'den silmek .
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        
        // Adım 2: Silinen elemanı, array'de yeni konumuna yerleştirmek.
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        
        // Adım 3: tableView'ın yeniden çizilmesini sağlamak.
        // Böylece TableView, güncellenen array sırası ile tüm elemanlarını tekrar çizecek.
        tableView.reloadData() // viewDidLoad'da çalışmaz.
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        // Bu fonksiyon, TableView editing modundayken her hücrenin
        // hangi tür editingStyle'a sahip olacağını belirtir.
        
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // indexPath: Editing aksiyonun gerçekleştiği hücrenin konumu.
        // editingStyle: Gerçekleşen aksiyon. (.delete veya .insert)
        
        if editingStyle == .delete{
            // Adım 1: 'emojis' array'inden indexPath.row'da bulunan objeyi sil.
            emojis.remove(at: indexPath.row)
            
            // Adım 2: TableView'a hücrenin silinmesi gerektiği bilgisi verilir...
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    // MARK: - Actions
    @IBAction func editButtonTapped(_ button: UIBarButtonItem){
        // isEditing: O an TableView'ın edit modda olup olmadığı bilgisini verir.
        let tableViewEditingMode = tableView.isEditing
        
        // TableView'ın editing moda girmesini ve çıkmasını sağlar.
        // '!' Boolean değerinin tersini alır. Örn: !true = false
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    @IBAction func unwindFromNewEmoji(_ segue: UIStoryboardSegue){
        // Bu fonksiyon, NewEmojiViewController tarafından çalıştırılacak.
        
        // NewEmojiViewController tarafından tetiklenen segue'nin 'save' olduğunu test eder.
        guard segue.identifier == "saveUnwind",
              let sourceViewController = segue.source as? NewEmojiTableViewController,
              let newEmoji = sourceViewController.emoji else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow{
            // Daha önceden bir hücre seçilmiş.
            // Emojinin ve TableView hücresinin güncellenmesi gerekiyor.
            
            // Adım 1: 'emojis' array'inin seçili hücrenin index'inde bulunan nesnenin güncellenmesi.
            emojis[selectedIndexPath.row] = newEmoji
            
            // Adım 2: Yalnızca seçili olan hücrenin yeniden çizilmesini sağlar.
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
            
        }else{
            // Seçili bir hücre bulunmuyor.
            // Yeni emoji eklenmeli.
            
            // Adım 1: Yeni bir hücre için IndexPath oluştur.
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            
            // Adım 2: Yeni emoji objesini 'emojis' array'ine ekle.
            emojis.append(newEmoji)
            
            // Adım 3: Oluşturulan IndexPath ile TableView'a yeni bir hücre eklenir.
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        
        
    }
}
