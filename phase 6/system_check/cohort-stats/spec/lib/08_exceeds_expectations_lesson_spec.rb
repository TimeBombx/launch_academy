require "spec_helper"

describe Lesson do
  let(:lesson) { Lesson.new("Test", "Body") }

  describe '.new' do
    it 'should create a new lesson' do
      expect(lesson).to be_a(Lesson)
    end
  end

  describe "#name" do
    it "has a reader for name" do
      expect(lesson.name).to eq("Test")
    end

    it "does not have a writer for name" do
      expect { lesson.name = "New test" }.to raise_error(NoMethodError)
    end
  end

  describe "#body" do
    it "has a reader for body" do
      expect(lesson.body).to eq("Body")
    end

    it "does not have a writer for body" do
      expect { lesson.body = "New Body" }.to raise_error(NoMethodError)
    end
  end

  describe '#submittable?' do
    it 'not be submittable by default' do
      expect(lesson.submittable?).to be(false)
    end
  end

  describe 'subclasses' do
    describe 'Article' do
      let(:article) { Article.new("Test", "Body") }

      it 'should create a new article' do
        expect(article).to be_a(Article)
      end

      it 'not be submittable by default' do
        expect(article.submittable?).to be(false)
      end
    end

    describe 'Challenge' do
      let(:challenge) { Challenge.new("Test", "Body") }

      it 'should create a new challenge' do
        expect(challenge).to be_a(Challenge)
      end

      it 'should be submittable' do
        expect(challenge.submittable?).to be(true)
      end
    end

    describe 'Video' do
      let(:video) { Video.new("Test", "Body", "test-url.com") }

      it 'should create a new video' do
        expect(video).to be_a(Video)
      end

      it 'should be submittable' do
        expect(video.submittable?).to be(false)
      end

      it 'should have a reader for url' do
        expect(video.url).to eq("test-url.com")
      end

      it "does not have a writer for name" do
        expect { video.url = "new-url.com" }.to raise_error(NoMethodError)
      end
    end
  end
end