Imports System.Linq
Imports System.Xml

Public Class Sitemap

    '------------Create sitemap base on .XML format------------'

    Public Enum ChangeFrequency
        always
        hourly
        daily
        weekly
        monthly
        yearly
        never
    End Enum

    Public Interface ISitemapItem
        ReadOnly Property Url() As String
        ReadOnly Property LastModified() As System.Nullable(Of DateTime)
        ReadOnly Property ChangeFrequency() As System.Nullable(Of ChangeFrequency)
        ReadOnly Property Priority() As System.Nullable(Of Single)
    End Interface

    Public Class SitemapItem

        Implements ISitemapItem

        Private _url As String
        Private _lastModified As System.Nullable(Of DateTime)
        Private _changeFrequency As System.Nullable(Of ChangeFrequency)
        Private _priority As System.Nullable(Of Single)

        Public Sub New(ByVal url As String, ByVal lastModified As System.Nullable(Of DateTime), ByVal changeFrequency As System.Nullable(Of ChangeFrequency), ByVal priority As System.Nullable(Of Single))
            Me._url = url
            Me._lastModified = lastModified
            Me._changeFrequency = changeFrequency
            Me._priority = priority
        End Sub

        Public ReadOnly Property ChangeFrequency() As ChangeFrequency? Implements ISitemapItem.ChangeFrequency
            Get
                Return _changeFrequency
            End Get
        End Property

        Public ReadOnly Property LastModified() As Date? Implements ISitemapItem.LastModified
            Get
                Return _lastModified
            End Get
        End Property

        Public ReadOnly Property Priority() As Single? Implements ISitemapItem.Priority
            Get
                Return _priority
            End Get
        End Property

        Public ReadOnly Property Url() As String Implements ISitemapItem.Url
            Get
                Return _url
            End Get
        End Property

    End Class

    Public Class XmlSitemapResult

        Private _items As IEnumerable(Of SitemapItem)

        Public Sub New(ByVal items As IEnumerable(Of SitemapItem))
            _items = items
        End Sub

        Public Sub CreateXmlSitemap(ByVal url As String)

            Dim doc As New XmlDocument()
            Dim docNode As XmlNode = doc.CreateXmlDeclaration("1.0", "UTF-8", Nothing)
            doc.AppendChild(docNode)

            Dim urlsetNode As XmlNode = doc.CreateElement("urlset")
            Dim xmlnsAttrib As XmlAttribute = doc.CreateAttribute("xmlns")
            xmlnsAttrib.Value = "http://www.sitemaps.org/schemas/sitemap/0.9"
            urlsetNode.Attributes.Append(xmlnsAttrib)
            doc.AppendChild(urlsetNode)

            Dim Node As XmlNode

            For Each itm As SitemapItem In _items

                Dim urlNode As XmlNode = doc.CreateElement("url")
                urlsetNode.AppendChild(urlNode)


                Node = doc.CreateElement("loc")
                Node.AppendChild(doc.CreateTextNode(itm.Url))
                urlNode.AppendChild(Node)

                If itm.LastModified.HasValue Then
                    Node = doc.CreateElement("lastmod")
                    Node.AppendChild(doc.CreateTextNode(itm.LastModified))
                    urlNode.AppendChild(Node)
                End If

                If itm.ChangeFrequency.HasValue Then
                    Node = doc.CreateElement("changefreq")
                    Node.AppendChild(doc.CreateTextNode(itm.ChangeFrequency.ToString()))
                    urlNode.AppendChild(Node)
                End If

                If itm.Priority.HasValue Then
                    Node = doc.CreateElement("priority")
                    Node.AppendChild(doc.CreateTextNode(itm.Priority))
                    urlNode.AppendChild(Node)
                End If

            Next

            doc.Save(url)

        End Sub

    End Class



End Class
