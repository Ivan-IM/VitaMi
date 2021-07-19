//
//  ElementsList.swift
//  VitaMi
//
//  Created by Иван Маришин on 04.07.2021.
//

import Foundation

struct Element: Identifiable {
    let id = UUID()
    let symbol: String
    let enName: String
    let ruName: String
    let type: String
    let elementInfo: String
    let ruProductInfo: Array<String>
    let normalValue: [String: Array<Double>]
    let helper: Array<String>
    let blocker: Array<String>
    
    static func getElementsList() -> [Element] {
        [
            Element(symbol: "Fe",
                    enName: "Iron",
                    ruName: "Железо",
                    type: "Microelement",
                    elementInfo: "Железо (Fe) - общее содержание железа в организме человека составляет около 4,25 г. Из этого количества 57% находится в гемоглобине крови, 23% - в тканях и тканевых ферментах, а остальные 20% - в печени, селезенке, костном мозге и представляют собой «физиологический резерв» железа. Средний пищевой рацион человека должен содержать не менее 20 мг железа, и 30 мг для беременных. Железо играет важную роль в питании клеток и тканей, снабжая их кислородом. Оно активно участвует в процессах кроветворения, являясь составной частью гемоглобина, и окислительно-восстановительных процессах, которые особенно интенсивно протекают в растущем детском организме. Этот микроэлемент является основным компонентом в синтезе ряда железосодержащих тканевых ферментов.",
                    ruProductInfo: ["Какао", "Печень говяжья", "Говядина", "Крупа гречневая", "Бобовые", "Овсянка", "Крольчатина", "Конина", "Яблоки", "Шпинат", "Зелень горчицы", "Груши", "Фундук", "Грецкий орех", "Белые грибы"],
                    normalValue: ["mkmol/l":[8.95, 30.43]],
                    helper: ["Vitamin C", "Vitamin B12", "Cu"],
                    blocker: ["Ca", "P", "Zn", "Vitamin E"]),
            Element(symbol: "I",
                    enName: "Iodine",
                    ruName: "Йод",
                    type: "Microelement",
                    elementInfo: "Йод (J) - йод входит в состав всех растений. Некоторые морские растения (фукус пузырчатый Fucus vesiculosus - бурая морская водоросль, морская губка Spongia maritima) обладают способностью концентрировать йод. Общее количество йода в организме около 25 мг, из них 15 мг - в щитовидной железе. Значительное количество йода содержится в печени, почках, коже, волосах, ногтях, яичниках и предстательной железе. Щитовидная железа является своего рода центральной регулирующей лабораторией, в которой образуются и накапливаются соединения йода. Нормальная потребность в йоде составляет около 100-150 мкг (для взрослых) и 175-200 мкг (для беременных и кормящих) в сутки.",
                    ruProductInfo: ["Печень трески", "Сашими", "Лосось", "Креветки", "Морской окунь", "Сельдь", "Треска", "Устрицы", "Водоросли"],
                    normalValue: [:],
                    helper: [],
                    blocker: ["Ca"]),
            Element(symbol: "K",
                    enName: "Potassium",
                    ruName: "Калий",
                    type: "Microelement",
                    elementInfo: "Калий (K) - общее содержание калия в организме человека составляет примерно 250г. Суточная потребность в калии составляет 1,5-2 г. Калию свойственна способность разрыхлять клеточные оболочки, делая их более проницаемыми для прохождения солей. Калий необходим для ясности ума, избавления от шлаков, лечения аллергии. Основными проявлениями недостатка калия являются - замедление роста организма и нарушение половых функций. Недостаток калия вызывает мышечные судороги, перебои в работе сердца. При применении внутрь даже больших доз калия, его токсическое действие не проявляется за исключением случаев почечной недостаточности.",
                    ruProductInfo: ["Соль", "Какао", "Чай", "Кофе", "Белые грибы", "Зелень", "Бананы", "Картофель", "Томаты", "Бобовые"],
                    normalValue: ["mmol/l":[3.50, 5.50]],
                    helper: ["Mg", "Vitamin B6"],
                    blocker: ["Na"]),
            Element(symbol: "Ca",
                    enName: "Calcium",
                    ruName: "Кальций",
                    type: "Microelement",
                    elementInfo: "Кальций (Ca) - общее содержание кальция в организме человека составляет примерно 1,9% общего веса человека, при этом 99% всего кальция приходится на долю скелета и лишь 1% содержится в остальных тканях и жидкостях организма. Суточная потребность в кальции для взрослого человека составляет – (0,45-0,8)-1,2 г в день. Кальций в пище, как растительной, так и животной, находится в виде нерастворимых солей. Всасывание их в желудке почти не происходит. Абсорбция кальциевых соединений происходит в верхней части тонких кишок, главным образом в 12-перстной кишке. Здесь на всасывание оказывают большое влияние желчные кислоты. Физиологическая регуляция уровня кальция в крови осуществляется гормонами паращитовидных желез и витамином D через посредство нервной системы. Кальций участвует во всех жизненных процессах организма. Нормальная свертываемость крови происходит только в присутствии солей кальция. Кальций играет важную роль в нервно-мышечной возбудимости тканей. При увеличении в крови концентрации ионов кальция и магния нервно-мышечная возбудимость уменьшается, а при увеличении концентрации ионов натрия и калия - повышается. Кальций играет определенную роль и в нормальной ритмической работе сердца. Без него невозможно нормальное протекание процессов, в которых задействованы отдельные гормоны.",
                    ruProductInfo: ["Молочные продукты", "Кофе", "Сардины", "Консервированный лосось с костями", "Палтус", "Ревень", "Шпинат", "Брокколи", "Миндаль", "Апельсины"],
                    normalValue: ["mmol/l":[2.15, 2,50]],
                    helper: ["Vitamin D", "Vitamin B2", "Vitamin B6", "Vitamin B12"],
                    blocker: ["P", "Mg", "Fe", "Na", "K"]),
            Element(symbol: "Mg",
                    enName: "Magnesium",
                    ruName: "Магний",
                    type: "Microelement",
                    elementInfo: "Магний (Mg) - общее содержание магния в организме человека составляет примерно 21 г. Главное «депо» магния находится в костях и мышцах: в костях фосфорнокислого магния содержится 1,5%, в эмали зубов - 0,75% (в кариозных зубах - 0,83-1,88%). Ежедневная потребность в магнии - 0,25-0,35 г. Магний является необходимой составной частью всех клеток и тканей, участвуя в месте с ионами других элементов в сохранении ионного равновесия жидких сред организма; входит в состав ферментов, связанных с обменом фосфора и углеводов; активирует фосфатазу плазмы и костей и участвует в процессе нервно- мышечной возбудимости.",
                    ruProductInfo: ["Чай", "Арбуз", "Кофе", "Какао", "Крупа гречневая", "Бобовые", "Кальмар", "Фундук", "Мучные изделия", "Сухофрукты"],
                    normalValue: ["mmol/l":[0.60, 0.95]],
                    helper: [],
                    blocker: ["Ca", "P"]),
            Element(symbol: "Cu",
                    enName: "Copper",
                    ruName: "Медь",
                    type: "Microelement",
                    elementInfo: "Медь (Cu) - общее содержание меди в организме человека составляет примерно 100-150 мг. В печени взрослых людей содержится в среднем 35 мг меди на 1 кг сухого веса. Поэтому печень можно рассматривать как «депо» меди в организме. В печени плода содержится в десятки раз больше меди, чем в печени  Медь необходима для процессов образования гемоглобина и в этом смысле не подлежит замене другими элементами. Медь также участвует в процессах роста и размножения. Участвует в процессах пигментации, так как входит в состав меланина. При недостатке меди в организме наблюдаются: задержка роста, анемия, дерматозы, депигментация волос, частичное облысение, потеря аппетита, сильное исхудание, понижение уровня гемоглобина, атрофия сердечной мышцы.",
                    ruProductInfo: ["Печень трески", "Говяжья печень", "Какао", "Кальмар", "Бобовые", "Мучные изделия", "Сухофрукты", "Крупа гречневая"],
                    normalValue: ["mkmol/l":[11.00, 24.00]],
                    helper: ["Fe"],
                    blocker: ["Vitamin C", "Zn"]),
            Element(symbol: "Na",
                    enName: "Sodium",
                    ruName: "Натрий",
                    type: "Microelement",
                    elementInfo: "Натрий (Na) - калий и натрий были открыты вместе и оба важны для нормального роста и состояния организма. Они являются антагонистами, т.е. повышение содержания натрия приводит к уменьшению содержания калия. Норма суточного потребления не существует, однако считается, что потребность взрослого человека составляет около 0,5 г хлорида натрия (поваренной соли) в сутки. Натрий в первую очередь нужен для нормального функционирования нервно-мышечной системы. При дефиците натрия происходит нарушение усвоения углеводов, возможны невралгии, отчасти понижение давления.",
                    ruProductInfo: ["Соль", "Сыр", "Колбасные изделия", "Консервы", "Фастфуд"],
                    normalValue: ["mmol/l":[135.00, 147.00]],
                    helper: ["Vitamin D"],
                    blocker: ["K", "Ca"]),
            Element(symbol: "P",
                    enName: "Phosphorus",
                    ruName: "Фосфор",
                    type: "Microelement",
                    elementInfo: "Фосфор (Р) - главным «депо» органических фосфорных соединений являются мышечная и костная ткани. Суточная потребность для взрослого человека составляет 0,8-1,2 г. Фосфор активно влияет на нормальный рост ребенка и развитие костной, мышечной и мозговой ткани, а также принимает участие в процессе обмена белка и жира. Для нормальной жизнедеятельности человеческого организма очень важен фосфорно-кальциевый обмен, нарушения которого приводят к рахиту, раннему кариесу, повышенной ломкости костей и различным расстройствам со стороны центральной нервной системы.",
                    ruProductInfo: ["Овсянка", "Крупа гречневая", "Рис", "Бобовые", "Петрушка", "Лук", "Морковь"],
                    normalValue: ["mmol/l":[0.80, 1.50]],
                    helper: ["Vitamin A", "Vitamin F"],
                    blocker: ["Ca", "Mg"]),
            Element(symbol: "Zn",
                    enName: "Zinc",
                    ruName: "Цинк",
                    type: "Microelement",
                    elementInfo: "Цинк (Zn) - отложение цинка в печени доходит до 500-600мг/1 кг веса; кроме того цинк отлагается преимущественно в мышцах и костной системе. Суточная потребность человека в цинке составляет 12-16мг для взрослых и 4-6мг для детей. Цинк оказывает влияние на активность половых и гонадотропных гормонов гипофиза. Цинк также увеличивает активность ферментов: фосфатаз кишечной и костной, катализирующих гидролиз. Тесная связь цинка с гормонами и ферментами объясняет его влияние на углеводный, жировой и белковый обмен веществ, на окислительно-восстановительные процессы, на синтетическую способность печени. Считается, что цинк обладает липотропным эффектом, т.е. способствует повышению интенсивности распада жиров, что проявляется уменьшением содержания жира в печени.",
                    ruProductInfo: ["Дрожжи", "Кунжут", "Устрицы", "Тунец", "Тыква", "Курятина", "Индюшатина", "Говядина", "Какао", "Кедровые орехи"],
                    normalValue: ["mkmol/l":[9.20, 20.00]],
                    helper: [],
                    blocker: ["Cu", "Ca", "Fe"]),
            Element(symbol: "Vitanim B1",
                    enName: "Vitanim B1",
                    ruName: "Витамин B1",
                    type: "Vitamin",
                    elementInfo: "Витамин В1 (тиамин, антиневритный). Источником витамина являются растительные продукты, неочищенный рис, мука грубого помола, отруби, горох, фасоль, соя, семена злаков, дрожжи, печень, мало в картофеле, капусте, моркови. Витамин В1 синтезируется микрофлорой ЖКТ канала. При недостатке витамина В1 развивается заболевание «берибери». При гиповитаминозе, в первую очередь, нарушается обмен углеводов и возникновению явлений ацидоза. Наступают нарушения деятельности нервной (парез, параличи, потеря координации движений, энцефалопатия), сердечно-сосудистой систем, ЖКТ канала (отсутствие аппетита, снижение секреции пищеварительных желез).",
                    ruProductInfo: ["Рис", "Бобовые", "Злаки", "Зелень", "Картофель", "Капуста", "Морковь"],
                    normalValue: [:],
                    helper: [],
                    blocker: []),
            Element(symbol: "Vitanim B2",
                    enName: "Vitanim B2",
                    ruName: "Витамин B2",
                    type: "Vitamin",
                    elementInfo: "Витамин В2 (рибофлавин, витамин роста). Впервые выделен из молочной сыворотки. Источниками рибофлавина являются продукты животного, растительного и бактериального происхождения. Витамином В2 богаты молочные продукты, сыр, яйца, мясо, печень, дрожжи. При недостатке витамина страдают высокоаэробные ткани – эпителий кожи и слизистых. Проявляется как сухость ротовой полости, губ и роговицы, хейлоз (трещины в уголках рта и на губах), глоссит, шелушение кожи в районе носогубного треугольника, ушей и шеи, конъюктивит и блефарит. ",
                    ruProductInfo: ["Субпродукты", "Молочные продукты", "Яйца", "Дрожжи", "Шпинат"],
                    normalValue: [:],
                    helper: ["Fe"],
                    blocker: []),
            Element(symbol: "Vitanim PP",
                    enName: "Vitanim PP",
                    ruName: "Витамин PP",
                    type: "Vitamin",
                    elementInfo: "Витамин РР (никотиновая кислота, никотинамид, витамин B3, ниацин). Витамин В3 синтезируется растениями, дрожжевыми клетками, микрофлорой ЖКТ канала. Недостаток витамина В3 наблюдается при однообразной диете и чрезмерном использовании антибиотиков, подавляющих микрофлору ЖКТ канала, и, следовательно, биосинтез витамина. Гипо- и авитаминоз приводят к задержке и остановке роста, уменьшению продуктивности и сопротивляемости к болезням, дерматитам, выпадению волос, нарушению координации движений.",
                    ruProductInfo: ["Дрожжи", "Рис", "Бобовые", "Злаки"],
                    normalValue: [:],
                    helper: [],
                    blocker: []),
            Element(symbol: "Vitanim B5",
                    enName: "Vitanim B5",
                    ruName: "Витамин B5",
                    type: "Vitamin",
                    elementInfo: "Витамин В5 (Пантотеновая кислота). Пантотеновая кислота синтезируется растениями и микроорганизмами, содержится во многих продуктах животного и растительного происхождения (яйцо, печень, мясо, рыба, молоко, дрожжи, картофель, морковь, пшеница, яблоки). В кишечнике человека витамин В5 в небольших количествах продуцируется кишечной палочкой. Пантотеновая кислота – универсальный витамин, в ней или её производных нуждаются человек, животные, растения и микроорганизмы.",
                    ruProductInfo: ["Яйца", "Говядина", "Свинина", "Баранина", "Курятина", "Рыба", "Молоко", "Субпродукты", "Картофель", "Морковь", "Яблоки", "Злаки"],
                    normalValue: [:],
                    helper: [],
                    blocker: []),
            Element(symbol: "Vitamin B6",
                    enName: "Vitamin B6",
                    ruName: "Витамин B6",
                    type: "Vitamin",
                    elementInfo: "Витамин В6 (адермин, пиридоксин, антидерматитный). Витамин широко распространен в природе, синтезируется растениями и микроорганизмами, в том числе микрофлорой ЖКТ. Богаты им печень, мясо, дрожжи, рыба, пшеничные отруби, горох, бобы. Недостаток витамина В6 вызывает повышение возбудимости ЦНС, периодические судороги, что связано с недостаточным образованием тормозного медиатора ГАМК, пеллагроподобные дерматиты, эритемы и пигментация кожи, полиневриты и отеки. Возможно развитие анемии, которая связана с нарушением синтеза гема.",
                    ruProductInfo: ["Рыба", "Говядина", "Свинина", "Баранина", "Курятина", "Бобовые", "Субпродукты", "Дрожжи", "Морковь", "Яйца", "Злаки"],
                    normalValue: [:],
                    helper: ["Fe"],
                    blocker: []),
            Element(symbol: "Vitanim B9",
                    enName: "Vitanim B9",
                    ruName: "Витамин B9",
                    type: "Vitamin",
                    elementInfo: "Фолиевая кислота (витамин Вc, витамин B9, витамин роста). Широко распространен в растительном мире, синтезируется в листьях растений, клетками дрожжей и микрофлорой ЖКТ канала. Им богаты пивные дрожжи, мука, картофель. В первую очередь недостаток витамина В9 затрагиваются органы кроветворения. Клетки не теряют способность расти, но в них происходит нарушение синтеза ДНК, обусловленное недостатком пуринов и пиримидинов, с остановкой деления. При гиповитаминозе фолиевой кислоты наблюдаются нарушения регенерации эпителия, особенно в ЖКТ, что приводит к развитию гастритов и энтеритов. Отмечается также замедление роста, конъюнктивит, ухудшение заживления ран, иммунодефициты, оживление хронических инфекций и субфебрилитет.",
                    ruProductInfo: ["Дрожжи", "Субпродукты", "Картофель", "Говядина", "Свинина", "Баранина", "Курятина"],
                    normalValue: [:],
                    helper: ["Fe"],
                    blocker: []),
            Element(symbol: "Vitanim B12",
                    enName: "Vitanim B12",
                    ruName: "Витамин B12",
                    type: "Vitamin",
                    elementInfo: "Витамин В12 (кобаламин, антианемический). Основной источник витамина - животные ткани. Много витамина содержат говяжья печень, мясо, рыба, молоко, яйца. Пищевая недостаточность – как правило, наблюдается у вегетарианцев. В то же время, если человек какое-то время жизни питался мясом, то запасы витамина в печени бывают настолько велики, что их хватает на несколько лет. Помимо нарушения кроветворной функции, для гиповитаминоза В12 специфично также расстройство деятельности нервной системы.",
                    ruProductInfo: ["Говядина", "Свинина", "Баранина", "Курятина", "Рыба", "Молочные продукты", "Яйца"],
                    normalValue: [:],
                    helper: [],
                    blocker: []),
            Element(symbol: "Vitamin C",
                    enName: "Vitamin C",
                    ruName: "Витамин C",
                    type: "Vitamin",
                    elementInfo: "Витамин С (аскорбиновая кислота, антицинготный, антискорбутный). Открытие витамина связано с выяснением природы цинги – заболевания, связанного с отсутствием в рационе свежих овощей и фруктов у моряков. Главные источники витамина – плоды шиповника, черная смородина, картофель, капуста, цитрусовые, сено бобовых культур, хвоя, ели и сосны. При нехватке витамина С снижается всасываемость железа в кишечнике, что вызывает снижение синтеза гема и гемоглобина и железодефицитную анемию. Уменьшается активность фолиевой кислоты, что может привести к мегалобластной анемии.",
                    ruProductInfo: ["Шиповник", "Смородина", "Цитрусовые", "Томаты", "Капуста", "Облепиха"],
                    normalValue: [:],
                    helper: ["Vitamin A", "Fe"],
                    blocker: ["Cu"]),
            Element(symbol: "Vitanim P",
                    enName: "Vitanim P",
                    ruName: "Витамин P",
                    type: "Vitamin",
                    elementInfo: "Витамин Р (рутин, витамин проницаемости), им богаты цитрусовые, особенно их кожура, в кожице черной смородине, шиповнике, черноплодной рябине. Дефицит приводит к ломкости и проницаемости капилляров, что проявляется кровоточивостью десен, мелкими кровоизлияниями в слизистых оболочках, коже, особенно в местах, подверженных нагрузке, проявления вазопатии с образованием петехий. Утомляемость, вялость, слабость, боли в плечах, в ногах при ходьбе.",
                    ruProductInfo: ["Клюква", "Бобовые", "Злаки", "Брусника", "Виноград", "Малина", "Чай", "Какао", "Красное и белое вино", "Цитрусовые"],
                    normalValue: [:],
                    helper: ["Vitamin C"],
                    blocker: []),
            Element(symbol: "Vitamin A",
                    enName: "Vitamin A",
                    ruName: "Витамин A",
                    type: "Vitamin",
                    elementInfo: "Витамин А (ретинол, антиксерофтальмический). Витамин А объединяет группы родственных соединений – ретинол, ретиналь, ретиноевую кислоту. Витамин А содержится только в животных продуктах. Особенно богаты им рыбий жир, коровье масло, печень. Витамин А - жизненно важный витамин, витамин роста, витамин продуктивности. Входит в состав родопсина – зрительного пигмента, обуславливающего сумеречное зрение; участвует в окислительно-восстановительных реакциях. При недостатке витамина с наступлением сумерек развивается куриная слепота, в дальнейшем возникает сухость роговицы глаза (ксерофтальмия), размягчение роговицы (кератомаляция) сухость кожи и слизистых оболочек. Все это приводит в дальнейшем к поражению мочеполовых путей, дыхательного и пищеварительного тракта и нарушению репродуктивной функции, развитию легочных и желудочнокишечных заболеваний, снижению иммунитета, нарушению проницаемости клеточных мембран, барьерной функции кожи.",
                    ruProductInfo: ["Говядина", "Свинина", "Баранина", "Рыба", "Молочные продукты", "Яйца", "Томаты", "Морковь"],
                    normalValue: [:],
                    helper: ["Vitamin E", "Vitamin C"],
                    blocker: ["Cu"]),
            Element(symbol: "Vitamin D",
                    enName: "Vitamin D",
                    ruName: "Витамин D",
                    type: "Vitamin",
                    elementInfo: "Витамин Д (кальциферол, антирахитический). Известны витамины Д2 (эргокальциферол) и Д3 (холекальциферол). Витамин Д3 образуется в коже под действием УФ-лучей из холестерина и поступает с рыбьим жиром, молоком, коровьим маслом, желтком яиц, печенью, дрожжами. Витамин Д откладывается в коже, где его в 2-3 раза больше, чем в крови и печени. Витамин Д3 преобладает в организме (85% всех витаминов) и из него синтезируется (в печени, почках) гормон кальцитриол, регулирующий обмен кальция и фосфора(2:1 или 1:1 - норма).",
                    ruProductInfo: ["Рыбий жир", "Лосось", "Сельдь", "Треска", "Яйцо", "Молочные продукты", "Авокадо"],
                    normalValue: [:],
                    helper: ["Ca"],
                    blocker: []),
            Element(symbol: "Vitamin E",
                    enName: "Vitamin E",
                    ruName: "Витамин E",
                    type: "Vitamin",
                    elementInfo: "Витамин Е ((токоферол от – «tokos» - потомство и «phero» - несу), антистерильный) по химической природе представляет собой α, у, в и б-токоферолы. Источниками витамина являются растительные масла, семена злаков, капуста, салат, шиповник, яичный желток, молоко, мясо, сало. Витамин Е откладывается во многих тканях (печени, миокарде, скелетных мышцах, жировой ткани). Витамин Е влияет на репродуктивную функцию, обмен селена в организме, выполняет антиоксидантную роль, защищая мембраны от перекисного окисления липидов, способствует биосинтезу белков, нуклеиновых кислот, защищает витамин А от окисления.",
                    ruProductInfo: ["Злаки", "Капуста", "Молочняе продукты", "Сало", "Говядина", "Баранина"],
                    normalValue: [:],
                    helper: ["Vitamin A"],
                    blocker: []),
            Element(symbol: "Vitamin F",
                    enName: "Vitamin F",
                    ruName: "Витамин F",
                    type: "Vitamin",
                    elementInfo: "Витамин F (комплекс полиненасыщенных жирных кислот, антихолестериновый). Влияние витамина F на организм человека очень широко. Он помогает усваивать жиры, нормализует жировой обмен в коже, способствует выведению из организма лишнего холестерина, положительно влияет на репродуктивную функцию. У маленьких детей, обычно на первом году жизни, часто проявляется гиповитаминоз витамина F, так как с пищей его поступает недостаточно. Если к тому же у ребёнка затруднено всасывание в кишечнике, и часто бывают инфекционные заболевания, то витамины почти не усваиваются в организме. Такие дети отстают в росте и плохо прибавляют в весе; у них шелушится кожа, а её верхний слой утолщается; появляется жидкий стул и задержки мочеиспускания (хотя воды дети начинают пить больше). У взрослых при длительной нехватке витамина F гораздо выше риск возникновения инфаркта и инсульта, тяжело переносится гипертония, поражаются крупные сосуды.",
                    ruProductInfo: ["Рыбий жир", "Лосось", "Треска", "Яйцо", "Молочные продукты", "Авокадо", "Сельдь", "Сухофрукты", "Кукуруза", "Бобовые"],
                    normalValue: [:],
                    helper: [],
                    blocker: []),
        ]
    }
}
