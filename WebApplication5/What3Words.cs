using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication5
{
    public class What3Words
    {
        public class Southwest
        {
            public double lng { get; set; }
            public double lat { get; set; }
        }

        public class Northeast
        {
            public double lng { get; set; }
            public double lat { get; set; }
        }

        public class Square
        {
            public Southwest southwest { get; set; }
            public Northeast northeast { get; set; }
        }

        public class Coordinates
        {
            public double lng { get; set; }
            public double lat { get; set; }
        }

        public class Root
        {
            public string country { get; set; }
            public Square square { get; set; }
            public string nearestPlace { get; set; }
            public Coordinates coordinates { get; set; }
            public string words { get; set; }
            public string language { get; set; }
            public string map { get; set; }
        }
    }
}