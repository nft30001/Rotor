Brute force Bitcoin private keys random 
![alt text](Others/2.jpg "Rotor")
# Rotor
Это модифицированная версия [oclexplorer](https://github.com/svtrostov/oclexplorer) от svtrostov.

# Часто задаваемые вопросы:
- [Как создать базу адресов adresses-160-sort.bin ](https://github.com/phrutis/Rotor/issues/1)
- [Зачем нужны файлы START.bat и Next.bat](https://github.com/phrutis/Rotor/issues/2)
- [Гипотеза - Почему Random лучше перебора ](https://github.com/phrutis/Rotor/issues/3)
## Параметры:
```
Rotor.exe -h
Usage: Rotor [options...]
Options:
    -p, --platform         Platform id [default: 0]
    -d, --device           Device id [default: 0]
    -r, --rows             Grid rows [default: 0(auto)]
    -c, --cols             Grid cols [default: 0(auto)]
    -i, --invsize          Mod inverse batch size [default: 0(auto)]
    -m, --mode             Address mode [default: 0] [0: uncompressed, 1: compressed, 2: both] (Required)
    -u, --unlim            Отключить генерацию нового хэша [по умолчанию: 0] [0: откл., 1: вкл.]  пример: -u 1
    -k, --privkey          Стартовый хэш пример: -k b5d4045c3f466fa91fe2cc6abe79232a1a57cdf104f7a26e716e0a1e2789df78
    -f, --file             RMD160 Address binary file path (Required)
    -h, --help             Shows this page
```

## Пример работы:
```
Rotor.exe -m 1 -f address6-160-sorted.bin

ARGUMENTS:
        PLATFORM ID: 0[default: 0]
        DEVICE ID  : 0[default: 0]
        NUM ROWS   : 0[default: 0(auto)]
        NUM COLS   : 0[default: 0(auto)]
        INVSIZE    : 0[default: 0(auto)]
        ADDR_MODE  : 1[0: uncompressed, 1: compressed, 2: both]
        UNLIM ROUND: 0
        PKEY BASE  :
        BIN FILE   : address6-160-sorted.bin

Loading addresses: 100 %
Loaded addresses : 195855350 in 171.433410 sec

Bloom at 000001B68EAF0430
        Version    : 2.1
        Entries    : 391710700
        Error      : 0.0000100000
        Bits       : 9386424816
        Bits/Elem  : 23.962646
        Bytes      : 1173303102 (1118 MB)
        Hash funcs : 17

Loading program file: gpu.cl


MATRIX:
        Grid size  : 3584x4096
        Total      : 14680064
        Mod inverse: 14336 threads [1024 ops/thread]

DEVICE INFO:
        Device              : GeForce GTX 1650
        Vendor              : NVIDIA Corporation (10de)
        Driver              : 461.40
        Profile             : FULL_PROFILE
        Version             : OpenCL 1.2 CUDA
        Max compute units   : 14
        Max workgroup size  : 1024
        Global memory       : 4294967296
        Max allocation      : 1073741824


Iteration 1 at [2021-03-20 00:10:01] from: af34b0f60ded1c5597e31d5ed65a27755f3621e7ed3b3ecb3151fb9fbada2dcd
[af34b0f60ded1c5597e31d5ed65a27755f3621e7ed3b3ecb3151fba04c1a2dcd] [round 167: 0.21s (69.28 Mkey/s)] [total 2,451,570,688 (65.94 Mkey/s)]

```
# Rotor2
## Изминения:
- Изменино время рандома. Выставил генерацию нового хэша каждые 1 сек. (было ~ 2-3 минуты) К новому хэшу добавляется значения +70-150 млн.
- Для удобства использования убрано отображение "Iteration 1 at [дата, время] from: xxxxxxxxxxxxxxxx" которое переносилось на новую строку и засоряло экран.
- Зафиксирована коретка printf, теперь после обновления нового хэша строка остается на месте.
- При использовании большого файла адресов (25млн.) в режиме both происходят ложные срабатывания найденых хэшей. Примерно 20-30 ложных адресов на 2.000.000.000 хэшей в связи с этим отключил вывод информации о найденом хэше на экран.
- Из-за ложных срабатываний при большой базе адресов. Для удобства сделал вывод в 2 файла Found.txt и BASE.txt В файле Found.txt только адреса, в файле BASE.txt вся информация.
- Сделано это для удобства, копируем адреса из файла Found.txt вставляем в окно проверки адресов списком на сайте. К примеру на сайтах https://www.homebitcoin.com/easybalance/ или https://bitcoindata.science/bitcoin-balance-check.html или http://addresschecker.eu можете найти свои сайты для проверски списком. Желательно проверять на двух разных сайтах, для точности.
- Файл gpu.cl нужен, без него не работает!

# Rotor3
## Изминения:
- Полный рандом. Возможно к новому хэшу добавляется +1 значение
- Файл gpu.cl нужен, без него не работает!

# Rotor10xxxxxxxx
## Изминения:
- Генерация нового хэша происходит после 10.000.000... значений указаных в названии
- Файл gpu.cl нужен, без него не работает!

## Donation
- BTC: bc1qh2mvnf5fujg93mwl8pe688yucaw9sflmwsukz9
