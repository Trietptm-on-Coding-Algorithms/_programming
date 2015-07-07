{<ios>
хедер, предоставляющий базовые классы и типы для иерархии классов ввода/вывода
{class ios_base
>> entire - весь
базовый класс для всей иерархии потоковых классов библиотеки стандартного ввода-вывода
описывающий наиболее базовую часть потока, которая общая для всех потоковых объектов, независимо от типа их символов
Он не имеет публичных конструкторов, и т.о. нельзя сосдавать объекты этого класса
и ios_base и basic_ios определяют компоненты потока, которые не зависят от того, поток ввода это или вывода
ios_base описывает члены, которые не зависят от шаблонных параметров (от типа символов и их свойств)
basic_ios писывает члены, которые зависят от этого

класс ios_base предоставляет следующую информацию о потоке
		поле					член-функция		описание
>> certain - определенный
формат	флаги формата			flags				множество внутренних флагов, которые влияют, 
								setf				как разные операции ввода/вывода интерпретируются или генерируются
								unsetf				смотри член-тип fmtflags
		ширина поля				width				ширина для вставки следующего форматированного элемента
		отображаемая точность	precision			десятичная точность для вставки следующего значения с плавающей точкой
		локаль					getloc				объект locale влияет свойствами локализации на функции операций
								imbue				форматированного ввода-вывода.
другое	обратный стек			register_callback	стек указателей на фуенкции, которые вызываются когда происходят определенные события
>> occur - происходить
		расширенные массивы		iword				внутренние массивы для сохранения объектов типов
								pword				long и void*
								xalloc				
{конструктор
protected: ios_base();
private:
  ios_base (const ios_base&);
  ios_base& operator= (const ios_base&);
}
{деструктор
virtual ~ios_base();
перед тем, как все callback функции, зарегистрированные в register_callback 
вызываются с первым аргкументом erase_event
}

{fmtflags
bitmask для представления флагов формата потоков
он используется как параметр и/или возвращаемое значение в членах-функциях flags, setf и unsetf
>> retrieve - извлекать
значения, переданные и полученные этими функциями могут являться любой допустимой комбинацией следующих членов-констант
поле			член-контанта	эффект при установке
независимые 	boolalpha		булевские элементы читаются/пишутся как алфавитные строки (true/false)
флаги			showbase		пишет целые значения с соответствующим префиксом базы СС
				showpoint		пишет значения с плавающей точкой всегда включая десятичную точку
				showpos			пишет неотрицательные числовые значения со знаком плюс (+)
				skipws			пропускае ведущие пробелы в определенных операциях ввода
				unitbuf			делает flush вывода после каждой операции вставки
				uppercase		пишет заглавные буквы, заменяя малые, в операциях вставки
основание СС	dec				читает пишет целые значения, используя десятичный формат
(basefield)		hex				читает пишет целые значения, используя шестнадцатеричный формат
				oct				читает пишет целые значения, используя восьмеричный формат
плавающий форматfixed			пишет значения с плавающей точкой в нотации с фиксированной точкой
(floatfield)	scientific		пишет значения с плавающей точкой в научной нотации
>> adjustment - регулировка
регулировочные	internal		вывод дополняется до ширины поля, вставляя символы заполнения в специфическую внутреннюю точку
(adjustfield)	left			вывод дополняется до ширины поля, вставляя символы заполнения в конец
				right			вывод дополняется до ширины поля, вставляя символы заполнения в начало

три дополнительные битмасковые константы являются комбинациями значений каждой из трех групп
basefield
floatfield
adjustfield

это публичные члены ios_base => это члены всех унаследованных от него классов

значения этого типа не надо путать с манипуляторами, которые имеют такиеже имена, но в глобальной области
потому, что они используются в разных обстоятельствах
>> circumstance - обстоятельство
манипуляторы не могу использоваться как значения для fmtflags, также как константы не могут использоваться как манипуляторы
ios_base::skipws
skipws
 - разные вещи
поведение манипуляторов в общем соответствует установке или снятию при помощи ios_base::setf/ios_base::unsetf
}
{flags
fmtflags flags() const;
fmtflags flags (fmtflags fmtfl);
}
{setf
fmtflags setf (fmtflags fmtfl);						=flags(fmtfl|flags())
fmtflags setf (fmtflags fmtfl, fmtflags mask);		=flags((fmtfl&mask)|(flags()&~mask))
}
{unsetf
void unsetf (fmtflags mask);
}
{precision
streamsize precision() const;
streamsize precision (streamsize prec);
точность в числах с плавающей точкой
}
{width
streamsize width() const;
streamsize width (streamsize wide);
ширина
}

{imbue
>> imbue - внушать, вселять
locale imbue (const locale& loc);
вселяет новую локаль
перед этим функция вызовет все функции, зарегистрированные через register_callback с первым аргументом imbue_event
стандартные классы потоков не наследуют этот член, а наследуют basic_ios::imbue
, который вызывает эту функцию, а также вселяет локаль в ассоциированный stream buffer, если таковой имеется
}
{getloc
locale getloc() const;
}

{xalloc
static int xalloc();
возвращает новое значение индекса, чтобы использовать членами функциями iword и pword 
во внутреннем расширяемом массиве
врутренний расширяемый массив - массив общего назначения объектов типа 
long (если использовать iword)
void* (если использовать pword)
}
{iword
long & iword (int idx);
дает целый элемент расширяемого массива
>> correspond - соответствовать
возвращает ссылку на объект типа long, соответствующий индексу idx во внутреннм расширяемом массиве
Если idx - индекс нового элемента, и внутренний массив еще не длинный (или еще не создан)
функция выделяет его (или создает) как необходимое множество ноль-инициализированных элементов
>> necessary - необходимо
>> least - как минимум, наименьший
>> at least - по крайней мере
>> perform - выполнять
возвращенная ссылка гарантированно действительно по крайней мере когда над объектом потока другие операции выполнены,
включая другие вызовы iword
}
}

}
{}
{}{}{}{}{}{}{}{}