Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$names = $speak.GetInstalledVoices().voiceinfo | select -Expand name

function actor
{
    cls
    $count = 0
    write-host "Romeo and Juliet: Scene II - Capulet's Garden, Act II - Balcony."
    write-host "----------------------------------------------------------------------------------------------------------------------" -ForegroundColor Yellow
    write-host ""
    write-host "Choose your actors:" -ForegroundColor yellow

    foreach($name in $names)
    {
        $count ++
        write-host $count") "$name
    }

    write-host ""
}

do
{
    do
    {
        actor
        $intRomeo = read-host 'Enter the numeric value for your desired "Romeo"'
        $intRomeo = [int]$intRomeo
    }
    while($intRomeo -isnot [int])
}
while($names[$intRomeo - 1].Length -lt 1)

do
{
    do
    {
        actor
        write-host "Romeo will be played by"$names[$intRomeo - 1] -ForegroundColor Yellow
        $intJuliet = read-host 'Enter the numeric value for your desired "Juliet"'
        $intJuliet = [int]$intJuliet
    }
    while($intJuliet -isnot [int])
}
while($names[$intJuliet - 1].Length -lt 1)

$count = 3
do
{
    actor
    write-host "Romeo will be played by"$names[$intRomeo - 1] -ForegroundColor Yellow
    write-host "Juliet will be played by"$names[$intJuliet - 1] -ForegroundColor Yellow
    write-host ""
    write-host "Starting in $count..."
    $count--
    start-sleep 1
}
while($count -gt 0)

$Romeo = '$speak.SelectVoice($names[$intRomeo - 1])'
$Juliet = '$speak.SelectVoice($names[$intJuliet - 1])'

function actRomeo
{
    cls
    write-host "Romeo and Juliet: Scene II - Capulet's Garden, Act II - Balcony."
    write-host "----------------------------------------------------------------------------------------------------------------------" -ForegroundColor Yellow
    write-host ""
    write-host "Romeo:"
    write-host $line -ForegroundColor cyan
    $speak.speak($line)
}

function actJuliet
{
    cls
    write-host "Romeo and Juliet: Scene II - Capulet's Garden, Act II - Balcony."
    write-host "----------------------------------------------------------------------------------------------------------------------" -ForegroundColor Yellow
    write-host ""
    write-host "Juliet:"
    write-host $line -ForegroundColor red
    $speak.speak($line)
}

iex $Romeo
$line = "But soft, what light through yonder window breaks?
It is the east and Juliet is the sun!
Arise, fair sun, and kill the envious moon,
Who is already sick and pale with grief
That thou her maid art far more fair than she.
Be not her maid, since she is envious;
Her vestal livery is but sick and green,
And none but fools do wear it. Cast it off.
It is my lady, O, it is my love!
O that she knew she were!
She speaks, yet she says nothing; what of that?
Her eye discourses, I will answer it.
I am too bold; 'tis not to me she speaks.
Two of the fairest stars in all the heaven,
Having some business, do entreat her eyes
To twinkle in their spheres till they return.
What if her eyes were there, they in her head?
The brightness of her cheek would shame those stars,
As daylight doth a lamp. Her eyes in heaven
Would through the airy region stream so bright
That birds would sing and think it were not night.
See how she leans her cheek upon her hand
O that I were a glove upon that hand,
That I might touch that cheek!"
actRomeo

iex $Juliet
$line = "Ay me!"
actJuliet

iex $Romeo
$line = "She speaks.
O, speak again, bright angel, for thou art
As glorious to this night, being o'er my head,
As is a winged messenger of heaven
Unto the white-upturned wondering eyes
Of mortals that fall back to gaze on him
When he bestrides the lazy-puffing clouds
And sails upon the bosom of the air."
actRomeo

iex $Juliet
$line = "O Romeo, Romeo! wherefore art thou Romeo?
Deny thy father and refuse thy name;
Or, if thou wilt not, be but sworn my love,
And I'll no longer be a Capulet."
actJuliet

iex $Romeo
$line = "Shall I hear more, or shall I speak at this?"
actRomeo

iex $Juliet
$line = "'Tis but thy name that is my enemy
Thou art thyself, though not a Montague.
What's Montague? It is nor hand, nor foot,
Nor arm, nor face, nor any other part
Belonging to a man. O, be some other name.
What's in a name? That which we call a rose
By any other name would smell as sweet;
So Romeo would, were he not Romeo called,
Retain that dear perfection which he owes
Without that title. Romeo, doff thy name,
And for that name, which is no part of thee,
Take all myself."
actJuliet

iex $Romeo
$line = "I take thee at thy word.
Call me but love, and I'll be new baptized
Henceforth I never will be Romeo."
actRomeo

iex $Juliet
$line = "What man art thou that, thus bescreened in night,
So stumblest on my counsel?"
actJuliet

iex $Romeo
$line = "By a name
I know not how to tell thee who I am
My name, dear saint, is hateful to myself,
Because it is an enemy to thee.
Had I it written, I would tear the word."
actRomeo

iex $Juliet
$line = "My ears have yet not drunk a hundred words
Of thy tongue's uttering, yet I know the sound.
Art thou not Romeo, and a Montague?"
actJuliet

iex $Romeo
$line = "Neither, fair saint, if either thee dislike."
actRomeo

iex $Juliet
$line = "How cam'st thou hither, tell me, and wherefore?
The orchard walls are high and hard to climb,
And the place death, considering who thou art,
If any of my kinsmen find thee here."
actJuliet

iex $Romeo
$line = "With love's light wings did I o'erperch these walls,
For stony limits cannot hold love out,
And what love can do, that dares love attempt
Therefore thy kinsmen are no stop to me."
actRomeo

iex $Juliet
$line = "If they do see thee, they will murder thee."
actJuliet

iex $Romeo
$line = "Alack, there lies more peril in thine eye
Than twenty of their swords. Look thou but sweet
And I am proof against their enmity."
actRomeo

iex $Juliet
$line = "I would not for the world they saw thee here."
actJuliet

iex $Romeo
$line = "I have night's cloak to hide me from their eyes,
And, but thou love me, let them find me here
My life were better ended by their hate
Than death prorogued, wanting of thy love."
actRomeo

iex $Juliet
$line = "By whose direction found'st thou out this place?"
actJuliet

iex $Romeo
$line = "By love, that first did prompt me to enquire.
He lent me counsel, and I lent him eyes.
I am no pilot, yet, wert thou as far
As that vast shore wash'd with the furthest sea,
I should adventure for such merchandise."
actRomeo

iex $Juliet
$line = "Thou knowest the mask of night is on my face,
Else would a maiden blush bepaint my cheek
For that which thou hast heard me speak tonight.
Fain would I dwell on form; fain, fain deny
What I have spoke. But farewell compliment.
Dost thou love me? I know thou wilt say 'Ay',
And I will take thy word. Yet, if thou swear'st,
Thou mayst prove false. At lovers' perjuries,
They say, Jove laughs. O gentle Romeo,
If thou dost love, pronounce it faithfully
Or if thou thinkest I am too quickly won,
I'll frown, and be perverse, and say thee nay,
So thou wilt woo: but else, not for the world.
In truth, fair Montague, I am too fond;
And therefore thou mayst think my 'haviour light
But trust me, gentleman, I'll prove more true
Than those that have more cunning to be strange.
I should have been more strange, I must confess,
But that thou overheard'st, ere I was 'ware,
My true-love passion: therefore pardon me;
And not impute this yielding to light love
Which the dark night hath so discovered."
actJuliet

iex $Romeo
$line = "Lady, by yonder blessed moon I vow,
That tips with silver all these fruit-tree tops"
actRomeo

iex $Juliet
$line = "O, swear not by the moon, the inconstant moon,
That monthly changes in her circled orb,
Lest that thy love prove likewise variable."
actJuliet

iex $Romeo
$line = "Do not swear at all.
Or if thou wilt, swear by thy gracious self,
Which is the god of my idolatry,
And I'll believe thee."
actRomeo

iex $Juliet
$line = "If my heart's dear love"
actJuliet

iex $Romeo
$line = "Well, do not swear: although I joy in thee,
I have no joy of this contract to-night
It is too rash, too unadvised, too sudden;
Too like the lightning, which doth cease to be
Ere one can say 'It lightens.' Sweet, good night!
This bud of love, by summer's ripening breath,
May prove a beauteous flower when next we meet.
Good night, good night! as sweet repose and rest
Come to thy heart as that within my breast!
Romeo.
O, wilt thou leave me so unsatisfied?
Juliet.
What satisfaction canst thou have to-night?
Romeo.
The exchange of thy love's faithful vow for mine.
Juliet.
I gave thee mine before thou didst request it,
And yet I would it were to give again.
Romeo.
Wouldst thou withdraw it? for what purpose, love?"
actRomeo

iex $Juliet
$line = "But to be frank, and give it thee again.
And yet I wish but for the thing I have
My bounty is as boundless as the sea,
My love as deep; the more I give to thee,
The more I have, for both are infinite.
Nurse calls within
I hear some noise within; dear love, adieu!
Anon, good nurse! Sweet Montague, be true.
Stay but a little, I will come again."
actJuliet

iex $Romeo
$line = "O blessed, blessed night! I am afeard.
Being in night, all this is but a dream,
Too flattering-sweet to be substantial."
actRomeo

iex $Juliet
$line = "Three words, dear Romeo, and good night indeed.
If that thy bent of love be honourable,
Thy purpose marriage, send me word to-morrow,
By one that I'll procure to come to thee,
Where and what time thou wilt perform the rite;
And all my fortunes at thy foot I'll lay
And follow thee my lord throughout the world.
I come, anon. But if thou mean'st not well,
I do beseech thee
By and by, I come
To cease thy suit, and leave me to my grief
To-morrow will I send."
actJuliet

iex $Romeo
$line = "So thrive my soul"
actRomeo

iex $Juliet
$line = "A thousand times good night!"
actJuliet

iex $Romeo
$line = "A thousand times the worse, to want thy light.
Love goes toward love, as schoolboys from
their books,
But love from love, toward school with heavy looks."
actRomeo

iex $Juliet
$line = "Hist! Romeo, hist! O, for a falconer's voice,
To lure this tassel-gentle back again!
Bondage is hoarse, and may not speak aloud
Else would I tear the cave where Echo lies,
And make her airy tongue more hoarse than mine,
With repetition of my Romeo's name."
actJuliet

iex $Romeo
$line = "It is my soul that calls upon my name:
How silver-sweet sound lovers' tongues by night,
Like softest music to attending ears!"
actRomeo

iex $Juliet
$line = "Romeo!"
actJuliet

iex $Romeo
$line = "My dear?"
actRomeo

iex $Juliet
$line = "At what o'clock to-morrow
Shall I send to thee?"
actJuliet

iex $Romeo
$line = "At the hour of nine."
actRomeo

iex $Juliet
$line = "I will not fail; 'tis twenty years till then.
I have forgot why I did call thee back."
actJuliet

iex $Romeo
$line = "Let me stand here till thou remember it."
actRomeo

iex $Juliet
$line = "I shall forget, to have thee still stand there,
Remembering how I love thy company."
actJuliet

iex $Romeo
$line = "And I'll still stay, to have thee still forget,
Forgetting any other home but this."
actRomeo

iex $Juliet
$line = "'Tis almost morning; I would have thee gone:
And yet no further than a wanton's bird
Who lets it hop a little from her hand,
Like a poor prisoner in his twisted gyves,
And with a silk thread plucks it back again,
So loving-jealous of his liberty."
actJuliet

iex $Romeo
$line = "I would I were thy bird."
actRomeo

iex $Juliet
$line = "Sweet, so would I:
Yet I should kill thee with much cherishing.
Good night, good night! parting is such
sweet sorrow,
That I shall say good night till it be morrow."
actJuliet

iex $Romeo
$line = "Sleep dwell upon thine eyes, peace in thy breast!
Would I were sleep and peace, so sweet to rest!
Hence will I to my ghostly father's cell,
His help to crave, and my dear hap to tell."
actRomeo

cls
write-host "`n`n`n`n`nEnd."
start-sleep 10
