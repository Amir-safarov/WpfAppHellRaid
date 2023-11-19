using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfAppHellRaid.Components;

namespace WpfAppHellRaid.Pages
{
    /// <summary>
    /// Логика взаимодействия для Authorization.xaml
    /// </summary>
    public partial class Authorization : Page
    {
        public Authorization()
        {
            InitializeComponent();
            App.isEmployee = false;
        }

        private void EnterBTN_Click(object sender, RoutedEventArgs e)
        {
            var emp = App.DataBase.Employee.Where(x => x.ID.ToString() == InputTB.Text).FirstOrDefault();
            var stud = App.DataBase.Student.Where(x => x.ID.ToString() == InputTB.Text).FirstOrDefault();
            if (emp!=null || stud !=null)
            {
                if(emp != null)
                {
                    App.isEmployee = true;
                    App.userNumber = emp.ID;
                    MessageBox.Show($"Найдет сотрудник {emp.ID}. Инициалы: {emp.SFP}.");
                    ModernNavigation.NextPage(new PageComponent("Меню", new ListsMenu()));
                }
                if(stud != null)
                {
                    App.isEmployee = false;
                    App.userNumber = stud.ID;
                    MessageBox.Show($"Найдет студент {stud.ID}. Инициалы: {stud.FIO}.");
                    ModernNavigation.NextPage(new PageComponent("Меню", new ListsMenu()));
                }
            }
            else
                MessageBox.Show("Нет пользователся с таким номером");
        }
    }
}
