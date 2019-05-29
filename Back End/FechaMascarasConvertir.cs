public DateTime? GetDateValue(string fechaString)
        {
            // Se intenta obtener la fecha por alguno de los siguientes formatos: dd/mm/yyyy, d/mm/yyyy, dd/m/yyyy o d/m/yyyy.
            //var regex = new Regex(@"(?<day>\d{1,2})\/(?<month>\d{1,2})\/(?<year>\d{2,4})");
            var regex = new Regex(@"(?<year>\d{2,4})\(?<month>\d{1,2})\(?<day>\d{1,2})");
            System.Text.RegularExpressions.Match match = regex.Match(fechaString);
            if (match.Success)
            {
                string year = match.Groups["year"].Value;
                string month = match.Groups["month"].Value;
                string day = match.Groups["day"].Value;
                return new DateTime(int.Parse(year), int.Parse(month), int.Parse(day));
            }
            else
            {
                return DateTime.MinValue;
            }
        }