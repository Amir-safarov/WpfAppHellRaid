using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using WpfAppHellRaid.Components;

namespace WpfAppHellRaid
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static SpecialForWPFSafEntities10 DataBase = new SpecialForWPFSafEntities10();
        public static bool isEmployee = false;
        public static bool isAdmin = false;
        public static int userNumber;
    }
}
