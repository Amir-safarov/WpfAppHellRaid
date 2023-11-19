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
            if (emp!=null || stud !=null || InputTB.Text =="admin")
            {
                if(emp != null)
                {
                    App.isEmployee = true;
                    App.userNumber = emp.ID;
                    MessageBox.Show($"Найдет сотрудник {App.userNumber}. Инициалы: {emp.SFP}.");
                    ModernNavigation.NextPage(new PageComponent("Меню", new ListsMenu()));
                }
                if(stud != null)
                {
                    App.isEmployee = false;
                    MessageBox.Show($"Студент {App.userNumber}. Инициалы: {stud.FIO}.\nСпециальность: {stud.Speciality.Name_spec}");
                    ModernNavigation.NextPage(new PageComponent("Меню", new ListsMenu()));
                }
                if(InputTB.Text == "admin")
                {
                    App.isEmployee = true;
                    App.isAdmin = true;
                    MessageBox.Show($"Админимстратор");
                    ModernNavigation.NextPage(new PageComponent("Меню", new ListsMenu()));

                }
            }
            else
                MessageBox.Show("Нет пользователся с таким номером");
        }
    }
}
