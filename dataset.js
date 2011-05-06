var datasets = {"average":{"label":"average","data":[[0,0],[8,0.20386642962694168],[16,0.20567430555820465],[32,0.21277452260255814],[64,0.25707111820097894],[128,0.22133167930271314],[256,0.22106189313142197],[512,0.2210697713105575],[1024,0.22521647654081645],[2048,0.23946311894585104],[4096,0.27641550699869794],[8192,0.26876984323774067],[16384,0.30604822295052664],[32768,0.42525691645486013],[65536,0.8481180838176182],[131072,2.4664123909814015]]},"bash":{"label":"bash","data":[[0,0],[8,0.09047126770019531],[16,0.16452670097351074],[32,0.36686205863952637],[61,0.9326777458190918]]},"coffee":{"label":"coffee","data":[[0,0],[8,0.1876370906829834],[16,0.17961716651916504],[32,0.18741083145141602],[64,0.18512511253356934],[78,0.16089510917663574]]},"erlang":{"label":"erlang","data":[[0,0],[8,1.2085492610931396],[16,1.1541969776153564],[32,1.151818037033081],[64,1.1927292346954346],[128,1.1420941352844238],[256,1.1395907402038574],[512,1.1389989852905273],[1024,1.2370359897613525],[2048,1.141658067703247],[4096,1.1419742107391357],[8192,1.1437489986419678],[16384,1.1557979583740234],[32768,1.1931281089782715],[65536,1.3890678882598877],[131072,2.2138500213623047]]},"falcon":{"label":"falcon","data":[[0,0],[8,0.014696836471557617],[16,0.014317750930786133],[32,0.014480829238891602],[64,0.015311717987060547],[92,0.01927804946899414]]},"fscript":{"label":"fscript","data":[[0,0],[8,0.10078096389770508],[16,0.10130572319030762],[32,0.1064291000366211],[64,0.2962460517883301],[78,0.11389589309692383]]},"gambit interpreted":{"label":"gambit interpreted","data":[[0,0],[8,0.01187896728515625],[16,0.011671066284179688],[32,0.011748790740966797],[64,0.015408992767333984],[128,0.011968135833740234],[256,0.012042999267578125],[512,0.012337923049926758],[1024,0.012499809265136719],[2048,0.01341104507446289],[4096,0.015956878662109375],[8192,0.02174997329711914],[16384,0.04362893104553223],[32768,0.11304402351379395],[65536,0.3494739532470703],[131072,1.2516453266143799]]},"gambit compiled":{"label":"gambit compiled","data":[[0,0],[8,0.011715173721313477],[16,0.011319160461425781],[32,0.01149606704711914],[64,0.013425111770629883],[128,0.011881828308105469],[256,0.011603116989135742],[512,0.011857748031616211],[1024,0.011897087097167969],[2048,0.012225151062011719],[4096,0.013730049133300781],[8192,0.01827716827392578],[16384,0.03522515296936035],[32768,0.10070204734802246],[65536,0.3152790069580078],[131072,1.1331470012664795]]},"go":{"label":"go","data":[[0,0],[8,0.005776166915893555],[16,0.006391048431396484],[32,0.005613088607788086],[64,0.00927734375],[128,0.0059702396392822266],[256,0.006494998931884766],[512,0.006525993347167969],[1024,0.011204957962036133],[2048,0.014401912689208984],[4096,0.01860213279724121],[8192,0.03441905975341797],[16384,0.07866382598876953],[32768,0.21649980545043945],[65536,0.722210168838501],[131072,2.6285181045532227]]},"haskell interpreted":{"label":"haskell interpreted","data":[[0,0],[8,0.1788473129272461],[16,0.17528581619262695],[32,0.17399907112121582],[64,0.20213699340820312],[128,0.18319296836853027],[256,0.1833200454711914],[512,0.1742849349975586],[1024,0.17191863059997559],[2048,0.1708528995513916],[4096,0.18672680854797363],[8192,0.1904280185699463],[16384,0.22075581550598145],[32768,0.38355040550231934],[65536,1.0359139442443848],[131072,3.7392969131469727]]},"haskell compiled":{"label":"haskell compiled","data":[[0,0],[8,0.005508899688720703],[16,0.0048978328704833984],[32,0.005396842956542969],[64,0.005933284759521484],[128,0.00574803352355957],[256,0.00574803352355957],[512,0.005819082260131836],[1024,0.00583195686340332],[2048,0.006579875946044922],[4096,0.007786989212036133],[8192,0.01234889030456543],[16384,0.027126789093017578],[32768,0.07506370544433594],[65536,0.3272531032562256],[131072,1.7433936595916748]]},"js on V8":{"label":"js on V8","data":[[0,0],[8,0.05425596237182617],[16,0.056984901428222656],[32,0.05453300476074219],[64,0.06158113479614258],[78,0.054163217544555664]]},"jruby":{"label":"jruby","data":[[0,0],[8,0.7784991264343262],[16,0.8076362609863281],[32,0.7887899875640869],[64,1.0530881881713867],[128,0.8235361576080322],[256,0.8240489959716797],[512,0.812816858291626],[629,0.8162600994110107]]},"lua":{"label":"lua","data":[[0,0],[8,0.005441188812255859],[16,0.005400896072387695],[32,0.0056040287017822266],[64,0.007109165191650391],[68,0.006510257720947266]]},"macruby":{"label":"macruby","data":[[0,0],[8,0.1159660816192627],[16,0.11629796028137207],[32,0.11463284492492676],[64,0.1365659236907959],[128,0.1192171573638916],[256,0.12042617797851562],[512,0.12142300605773926],[1024,0.13330721855163574],[1883,0.14664912223815918]]},"macruby aot":{"label":"macruby aot","data":[[0,0],[8,0.06701397895812988],[16,0.06835794448852539],[32,0.06709504127502441],[64,0.08098626136779785],[128,0.07408595085144043],[256,0.06783270835876465],[512,0.07196402549743652],[1024,0.09915995597839355],[1869,0.09801292419433594]]},"C# Mono":{"label":"C# Mono","data":[[0,0],[8,0.061985015869140625],[16,0.06139183044433594],[32,0.06441211700439453],[64,0.07733297348022461],[128,0.061913251876831055],[256,0.062136173248291016],[512,0.06621909141540527],[1024,0.06359386444091797],[2048,0.07117795944213867],[4096,0.08103799819946289],[8192,0.12323904037475586],[16384,0.25069522857666016],[32768,0.6985740661621094],[65536,2.402764081954956],[131072,8.408007860183716]]},"F# Mono":{"label":"F# Mono","data":[[0,0],[8,0.11363506317138672],[16,0.11049771308898926],[32,0.10876202583312988],[64,0.13964414596557617],[128,0.11316680908203125],[256,0.11333394050598145],[512,0.11154818534851074],[1024,0.11203694343566895],[2048,0.12776875495910645],[4096,0.12391114234924316],[8192,0.14858102798461914],[16384,0.24478507041931152],[32768,0.6082668304443359],[65536,1.9631550312042236],[131072,6.691558122634888]]},"nu":{"label":"nu","data":[[0,0],[8,0.06546401977539062],[16,0.06564903259277344],[32,0.06480002403259277],[64,0.08263301849365234],[78,0.06630563735961914]]},"Objective-C":{"label":"Objective-C","data":[[0,0],[8,0.011288166046142578],[16,0.010960817337036133],[32,0.011153936386108398],[64,0.015838146209716797],[128,0.01137995719909668],[256,0.011158227920532227],[512,0.011019229888916016],[1024,0.011652231216430664],[2048,0.0108489990234375],[4096,0.011773109436035156],[8192,0.011153936386108398],[16384,0.011469125747680664],[32768,0.011452913284301758],[65536,0.011987924575805664],[131072,0.013696670532226562]]},"perl":{"label":"perl","data":[[0,0],[8,0.011218070983886719],[16,0.010680198669433594],[32,0.01409769058227539],[64,0.014685869216918945],[93,0.011619806289672852]]},"perl6 rakudo":{"label":"perl6 rakudo","data":[[0,0],[8,0.9141290187835693],[16,0.9192569255828857],[32,0.9144577980041504],[64,1.1869959831237793],[75,0.952476978302002]]},"python 2.7":{"label":"python 2.7","data":[[0,0],[8,0.03873491287231445],[16,0.03870105743408203],[32,0.03900909423828125],[64,0.04519510269165039],[128,0.03881406784057617],[256,0.0390777587890625],[512,0.03985309600830078],[997,0.04444122314453125]]},"python 3.2":{"label":"python 3.2","data":[[0,0],[8,0.07546091079711914],[16,0.07334303855895996],[32,0.0720360279083252],[64,0.08668303489685059],[128,0.07228994369506836],[256,0.07427787780761719],[512,0.07884502410888672],[996,0.07565426826477051]]},"racket interpreted":{"label":"racket interpreted","data":[[0,0],[8,0.32433390617370605],[16,0.3289661407470703],[32,0.32498979568481445],[64,0.37912797927856445],[128,0.32734203338623047],[256,0.3304250240325928],[512,0.3298039436340332],[1024,0.32435107231140137],[2048,0.3292357921600342],[4096,0.36220693588256836],[8192,0.37114381790161133],[16384,0.38320112228393555],[32768,0.4417133331298828],[65536,0.6380791664123535],[131072,1.4928817749023438]]},"racket compiled":{"label":"racket compiled","data":[[0,0],[8,0.27069902420043945],[16,0.2572667598724365],[32,0.2534768581390381],[64,0.29461193084716797],[128,0.25618529319763184],[256,0.25693488121032715],[512,0.2566239833831787],[1024,0.25978708267211914],[2048,0.25688695907592773],[4096,0.25796031951904297],[8192,0.26308298110961914],[16384,0.285297155380249],[32768,0.33813977241516113],[65536,0.5453429222106934],[131072,1.410984992980957]]},"rubinius":{"label":"rubinius","data":[[0,0],[8,0.39315104484558105],[16,0.42209506034851074],[32,0.4252769947052002],[64,0.5095889568328857],[128,0.425490140914917],[256,0.422792911529541],[512,0.42456483840942383],[1024,0.42373204231262207],[2048,0.45202088356018066],[4096,0.5130009651184082],[5788,0.5286228656768799]]},"ruby 1.8.7":{"label":"ruby 1.8.7","data":[[0,0],[8,0.014982938766479492],[16,0.018278837203979492],[32,0.014460086822509766],[64,0.019995927810668945],[128,0.015207290649414062],[256,0.01553201675415039],[512,0.016626834869384766],[1024,0.018398284912109375],[2048,0.03066706657409668],[2786,0.037142038345336914]]},"ruby 1.9.2":{"label":"ruby 1.9.2","data":[[0,0],[8,0.014101028442382812],[16,0.01379084587097168],[32,0.013497114181518555],[64,0.01848292350769043],[128,0.014636754989624023],[256,0.014488935470581055],[512,0.015645980834960938],[1024,0.0169980525970459],[2048,0.02783203125],[2786,0.025157928466796875]]},"sbcl interpreted":{"label":"sbcl interpreted","data":[[0,0],[8,0.11140584945678711],[16,0.1108863353729248],[32,0.11319398880004883],[64,0.11883115768432617],[128,0.11320281028747559],[256,0.1114199161529541],[512,0.11175417900085449],[1024,0.11396503448486328],[2048,0.11253094673156738],[4096,0.11717605590820312],[8192,0.11854696273803711],[16384,0.13590288162231445],[32768,0.20758986473083496],[65536,0.3222479820251465],[131072,0.8349220752716064]]},"sbcl compiled":{"label":"sbcl compiled","data":[[0,0],[8,0.0972127914428711],[16,0.09569692611694336],[32,0.09240889549255371],[64,0.09829187393188477],[128,0.09229683876037598],[256,0.09354496002197266],[512,0.09314393997192383],[1024,0.09421682357788086],[2048,0.09726476669311523],[4096,0.0950930118560791],[8192,0.09956097602844238],[16384,0.11669468879699707],[32768,0.16759419441223145],[65536,0.301300048828125],[131072,0.8110918998718262]]},"scala":{"label":"scala","data":[[0,0],[8,1.1478407382965088],[16,1.1451630592346191],[32,1.1960928440093994],[64,1.579057216644287],[128,1.1494629383087158],[256,1.1442220211029053],[512,1.1495609283447266],[1024,1.1575260162353516],[2048,1.195509910583496],[4096,1.199295997619629],[8192,1.2064969539642334],[16384,1.29543137550354],[32768,1.398277759552002],[65536,1.5495779514312744],[131072,2.1567790508270264]]},"tcl":{"label":"tcl","data":[[0,0],[8,0.02104496955871582],[16,0.02074599266052246],[32,0.020749807357788086],[64,0.027283906936645508],[128,0.021545886993408203],[256,0.023971080780029297],[512,0.023366928100585938],[996,0.037964820861816406]]}}
