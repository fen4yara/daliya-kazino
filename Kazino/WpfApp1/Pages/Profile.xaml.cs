using QRCoder;
using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.Drawing;
using System.IO;
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
using WpfApp1.DB;

namespace WpfApp1.Pages
{
    /// <summary>
    /// Логика взаимодействия для Profile.xaml
    /// </summary>
    public partial class Profile : Page
    {
        private string _name;
        public Profile(string name)
        {
            InitializeComponent();
            _name = name;
            var user = ConnectionClass.connect.User.FirstOrDefault(u => u.Username == _name);

                string[] links = {
            "https://a.d-cd.net/8a63f31s-960.jpg",
            "https://ae04.alicdn.com/kf/U8f4cf84e9f384c5c8158ab3fb314529cV.jpg",
            "https://www.cbr.ru/StaticHtml/File/96637/5r_97_av.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/20000-rubles-Belarus-2000-f.jpg/800px-20000-rubles-Belarus-2000-f.jpg",
            "https://coinsandnotes.ru/wa-data/public/shop/products/92/89/8992/images/18446/18446.970.jpg",
            "https://ru-moneta.ru/upload/moneta-ru/1961-01-rubl-00.jpg",
            "https://milliard.tatar/images/uploads/news/2022/11/16/7532787ed7dd039083a7efda29a7549d.jpg"
        };

            Random random = new Random();
            int index = random.Next(links.Length);
            imgg.Source = GeneratorQrCodeBitmapImage($"{links[index]}");
            if (user != null)
            {
                UsernameTextBlock.Text = user.Username;
                RegistrationDateTextBlock.Text = user.RegistrationDate.ToString("dd.MM.yyyy");
                BalanceTextBlock.Text = $"{user.Balance:C}";
                if (user.Balance < 0)
                {
                    MessageBox.Show("У вас есть задолженность. Погасите ее, чтобы продолжить.", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
                }


            }
            else
            {
                MessageBox.Show("Пользователь не найден.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);

            }
        }
        private void LoadUserProfile()
        {
            
        }

        private void ReportButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Reports(_name));
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
        private BitmapImage GeneratorQrCodeBitmapImage(string text)
        {
            using (QRCodeGenerator qrGenerator = new QRCodeGenerator())
            {
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(text, QRCodeGenerator.ECCLevel.Q); using (QRCode qrCode = new QRCode(qrCodeData))
                {
                    using (Bitmap qrBitmap = qrCode.GetGraphic(20))
                    {
                        using (MemoryStream ms = new MemoryStream())
                        {
                            qrBitmap.Save(ms, ImageFormat.Png);
                            ms.Position = 0;
                            BitmapImage bitmapImage = new BitmapImage(); bitmapImage.BeginInit();
                            bitmapImage.CacheOption = BitmapCacheOption.OnLoad; bitmapImage.StreamSource = ms;
                            bitmapImage.EndInit();
                            return bitmapImage;
                        }
                    }
                }
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            var user = ConnectionClass.connect.User.FirstOrDefault(u => u.Username == _name);
            NavigationService.Navigate(new Report(user));
        }
    }
}
