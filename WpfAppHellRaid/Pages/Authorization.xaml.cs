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
        private Employee employee;
        private Student student;
        public Authorization()
        {
            InitializeComponent();
        }

        private void EnterBTN_Click(object sender, RoutedEventArgs e)
        {
            var emp = App.DataBase.Employee.Where(x => x.ID.ToString() == InputTB.Text).FirstOrDefault();
            if (emp!=null)
            {
                App.isEmployee = true;
                MessageBox.Show("номером");
            }
            else
                MessageBox.Show("Нет пользователся с таким номером");
        }
    }
}
