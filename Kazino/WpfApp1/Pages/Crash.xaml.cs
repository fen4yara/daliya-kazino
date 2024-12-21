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
using System.Windows.Threading;
using System.Xml.Linq;
using Telegram.Bot.Types;
using WpfApp1.DB;

namespace WpfApp1.Pages
{
    /// <summary>
    /// Логика взаимодействия для Crash.xaml
    /// </summary>
    public partial class Crash : Page
    {

        private List<Card> _deck;
        private List<Card> _playerHand;
        private List<Card> _dealerHand;
        private Random _random;
        private decimal _betAmount; // Ставка игрока
        private DB.User _user; // Текущий пользователь
        private bool _gameOver = false;
        private string _name;

        public Crash(string name)
        {
            InitializeComponent();
            _name = name;
            _random = new Random();
            _user = ConnectionClass.connect.User.FirstOrDefault(u => u.Username == name);
        }


            // Обработчик кнопки подтверждения ставки
            private void ConfirmBet_Click(object sender, RoutedEventArgs e)
            {
                if (decimal.TryParse(BetAmountTextBox.Text, out decimal betAmount) && betAmount > 0)
                {
                    _betAmount = betAmount;
                    BetAmountTextBlock.Text = $"Ставка: {_betAmount:C}";

                    StartNewGame();
                }
                else
                {
                    MessageBox.Show("Введите корректную ставку.");
                }
                var user = ConnectionClass.connect.User.FirstOrDefault(u => u.Username == _name);
                if (user.Balance < _betAmount)
                {
                    MessageBox.Show("Недостаточно средств для ставки.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                 return;

                }
            }

            // Начало новой игры
            private void StartNewGame()
            {
                _deck = GenerateDeck();
                _playerHand = new List<Card>();
                _dealerHand = new List<Card>();

                _playerHand.Add(DrawCard());
                _playerHand.Add(DrawCard());

                _dealerHand.Add(DrawCard());
                _dealerHand.Add(DrawCard());

                _gameOver = false;
                HitButton.IsEnabled = true;
                StandButton.IsEnabled = true;

                UpdateUI();
            }

            // Обновление интерфейса
            private void UpdateUI(bool revealDealerCards = false)
            {
                PlayerCardsTextBlock.Text = $"Ваши карты: {string.Join(", ", _playerHand)}";
                PlayerScoreTextBlock.Text = $"Ваш счет: {CalculateScore(_playerHand)}";

                           if (revealDealerCards)
            {
                DealerCardsTextBlock.Text = $"Карты дилера: {string.Join(", ", _dealerHand)}";
                DealerScoreTextBlock.Text = $"Счет дилера: {CalculateScore(_dealerHand)}";
            }
            else
            {
                DealerCardsTextBlock.Text = $"Карты дилера: {_dealerHand[0]}, [скрытая карта]";
                DealerScoreTextBlock.Text = "Счет дилера: ?";
            }
        
            }

        // Кнопка "Взять карту"
        private void HitButton_Click(object sender, RoutedEventArgs e)
        {
            if (_gameOver) return;

            _playerHand.Add(DrawCard());
            UpdateUI();

            if (CalculateScore(_playerHand) > 21)
            {
                ResultTextBlock.Text = "Вы проиграли!";
                RecordGameSession(false); // Запись проигрыша
                EndGame();
            }
            
        }

            // Кнопка "Остановиться"
            private void StandButton_Click(object sender, RoutedEventArgs e)
            {
                if (_gameOver) return;

                while (CalculateScore(_dealerHand) < 17)
                {
                    _dealerHand.Add(DrawCard());
                }

                var playerScore = CalculateScore(_playerHand);
                var dealerScore = CalculateScore(_dealerHand);

                if (dealerScore > 21 || playerScore > dealerScore)
                {
                    ResultTextBlock.Text = "Вы выиграли!";
                    RecordGameSession(true); // Запись выигрыша
                }
                else
                {
                    ResultTextBlock.Text = "Вы проиграли!";
                    RecordGameSession(false); // Запись проигрыша
                }

                UpdateUI(true); // Показываем карты дилера
                EndGame();
            }

            // Запись игровой сессии в базу данных
            private void RecordGameSession(bool won)
            {


    _user.Balance += won ? Convert.ToInt32(_betAmount) : Convert.ToInt32(-_betAmount);
                ConnectionClass.connect.SaveChanges();
            }

            // Завершение игры
            private void EndGame()
            {
                _gameOver = true;
                HitButton.IsEnabled = false;
                StandButton.IsEnabled = false;
            }

            // Генерация колоды карт
            private List<Card> GenerateDeck()
            {
                var suits = new[] { "♠", "♥", "♦", "♣" };
                var values = new[] { "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A" };
                var deck = new List<Card>();

                foreach (var suit in suits)
                {
                    foreach (var value in values)
                    {
                        deck.Add(new Card { Suit = suit, Value = value });
                    }
                }

                return deck;
            }

            // Взять карту из колоды
            private Card DrawCard()
            {
                var cardIndex = _random.Next(_deck.Count);
                var card = _deck[cardIndex];
                _deck.RemoveAt(cardIndex);
                return card;
            }

            // Подсчет очков
            private int CalculateScore(List<Card> hand)
            {
                int score = 0;
                int aceCount = 0;

                foreach (var card in hand)
                {
                    if (int.TryParse(card.Value, out int value))
                    {
                        score += value;
                    }
                    else if (card.Value == "A")
                    {
                        aceCount++;
                        score += 11;
                    }
                    else
                    {
                        score += 10;
                    }
                }

                while (score > 21 && aceCount > 0)
                {
                    score -= 10;
                    aceCount--;
                }

                return score;
            }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Menu(_user.Balance, _user.Username));
        }
    }

    public class Card
        {
            public string Suit { get; set; }
            public string Value { get; set; }

            public override string ToString()
            {
                return $"{Value}{Suit}";
            }
        }
    } 
